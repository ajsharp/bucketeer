module Bucketeer

  # @param [Hash] data a hash of data, where they keys are Time objects
  #   {"timestamp": "value"}
  # @param [Integer, Symbol] interval the interval by which data is bucketed
  #   If an integer, interval if the number of seconds.
  #   If a symbol, interval must be one of :day, :month, :week, :annual
  # @return [Hash] the bucketed hash of data
  def self.bucket(set, interval)
    bucketed = Hash.new { |h, k| h[k] = 0 }

    set.each_pair do |time, value|
      milliseconds_since_epoch = time.to_i * 1000
      interval_in_milliseconds = interval * 1000
      time_since_last_interval = milliseconds_since_epoch % interval_in_milliseconds
      time_until_next_interval = interval_in_milliseconds - time_since_last_interval

      end_of_interval = Time.at((milliseconds_since_epoch + time_until_next_interval) / 1000)
      bucketed[end_of_interval] += value
    end
    bucketed
  end
end
