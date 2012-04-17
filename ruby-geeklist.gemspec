# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "geeklist/version"

Gem::Specification.new do |s|
  s.name        = "geeklist"
  s.version     = Geeklist::VERSION
  s.authors     = ["Andrew Holman"]
  s.email       = ["andy@27eleven.com"]
  s.homepage    = "https://github.com/zenom/geeklist"
  s.summary     = %q{Ruby API for Geeklist}
  s.description = %q{Ruby API for Geeklist}

  s.rubyforge_project = "ruby-geeklist"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  #s.add_dependency 'faraday', '~> 0.7'
  #s.add_dependency 'json'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'fivemat'
  s.add_development_dependency 'awesome_print'
end
