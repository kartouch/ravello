# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ravello/version'

Gem::Specification.new do |spec|
  spec.name          = "ravello"
  spec.version       = Ravello::VERSION
  spec.authors       = ["Christophe Augello"]
  spec.email         = ["christope@augello.be"]
  spec.summary       = %q{Ruby wrapper for Ravello API.}
  spec.description   = %q{Ruby wrapper for Ravello API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency 'rake', '~> 0'
  spec.add_runtime_dependency 'httparty', '~> 0.14', '>= 0.14.0'


end
