# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "deagol/version"

Gem::Specification.new do |s|
  s.name        = "deagol"
  s.version     = Deagol::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Karel Minarik"]
  s.email       = ["karmi@karmi.cz"]
  s.homepage    = ""
  s.summary     = %q{Parse/index Gollum pages into ElasticSearch}

  s.rubyforge_project = "deagol"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
