# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'bucketeer'
require "bucketeer/version"

Gem::Specification.new do |s|
  s.name        = "bucketeer"
  s.version     = Bucketeer::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alex Sharp"]
  s.email       = ["ajsharp@gmail.com"]
  s.homepage    = "https://github.com/ajsharp/bucketeer"
  s.summary     = %q{Utility to assist with bucketing data}
  s.description = %q{Utility to assist with bucketing data}

  s.rubyforge_project = "mongo_utils"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
