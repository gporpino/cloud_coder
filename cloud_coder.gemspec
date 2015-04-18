# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloud_coder/version'

Gem::Specification.new do |spec|
  spec.name          = "cloud_coder"
  spec.version       = CloudCoder::VERSION
  spec.authors       = ["Gustavo Porpino"]
  spec.email         = ["gporpino@gmail.com"]
  spec.summary       = %q{Gem to easily dev on cloud with your own machine}
  spec.description   = %q{Gem to easily dev on cloud with your own machine}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.executables   = ['cloud_coder']
  spec.files            = Dir.glob("{bin,lib}/**/*")
  
  spec.add_runtime_dependency "aws-sdk", "~> 2"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
