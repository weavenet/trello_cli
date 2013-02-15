# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby-trello-cli/version'

Gem::Specification.new do |gem|
  gem.name          = "ruby-trello-cli"
  gem.version       = RubyTrelloCli::VERSION
  gem.authors       = ["Brett Weaver"]
  gem.email         = ["brett@weav.net"]
  gem.description   = %q{Ruby Gem w/ CLI to access Trello}
  gem.summary       = %q{Ruby Gem w/ CLI to access Trello}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"

  gem.add_runtime_dependency 'ruby-trello', '0.5.1'
end
