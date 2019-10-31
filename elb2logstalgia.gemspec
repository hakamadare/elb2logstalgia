# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elb2logstalgia/version'

Gem::Specification.new do |spec|
  spec.name          = "elb2logstalgia"
  spec.version       = Elb2Logstalgia::VERSION
  spec.authors       = ["Steve Huff"]
  spec.email         = ["shuff@vecna.org"]

  spec.summary       = %q{Translate AWS ELB logs to Logstalgia custom format.}
  spec.homepage      = %q{https://github.com/hakamadare/elb2logstalgia}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = "e2l"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2"
  spec.add_development_dependency "irbtools", "~> 3.0"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_development_dependency "hashie", "~> 4.0"
  spec.add_development_dependency "methadone", "~> 2.0"
  spec.add_development_dependency "timeliness", "~> 0.3"

end
