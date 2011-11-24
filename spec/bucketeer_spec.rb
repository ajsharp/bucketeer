require 'spec_helper'

describe Bucketeer, '.bucket' do
  context "1 minute intervals" do
    let(:set) do
      { Time.new(2011, 11, 22, 1, 1) => 1,
        Time.new(2011, 11, 22, 1, 1, 59) => 1,
        Time.new(2011, 11, 22, 1, 2) => 1
      }
    end

    subject { Bucketeer.bucket(set, 60) }

    it {
      should == {
        Time.new(2011, 11, 22, 1, 2) => 2,
        Time.new(2011, 11, 22, 1, 3) => 1
      }
    }
  end

  context "5 minute intervals" do
    let(:set) do
      { Time.new(2011, 11, 22, 1, 1) => 1,
        Time.new(2011, 11, 22, 1, 1, 59) => 1,
        Time.new(2011, 11, 22, 1, 2) => 1,
        Time.new(2011, 11, 22, 1, 2, 30) => 1,
        Time.new(2011, 11, 22, 1, 4, 59) => 1,
        Time.new(2011, 11, 22, 1, 5, 1) => 1
      }
    end

    subject { Bucketeer.bucket(set, 300) }

    it {
      should == {
        Time.new(2011, 11, 22, 1, 5) => 5,
        Time.new(2011, 11, 22, 1, 10) => 1
      }
    }
  end
end
