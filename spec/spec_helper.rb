require 'rubygems'
require 'rspec'

$:.unshift(File.dirname(File.expand_path(__FILE__)))

require File.join(File.dirname(File.expand_path(__FILE__)), "..", "lib", "bucketeer")

RSpec.configure do |c|
end
