# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ninja_server/version'

Gem::Specification.new do |spec|
  spec.name          = "ninja_server"
  spec.version       = NinjaServer::VERSION
  spec.authors       = ["Lillian Ng"]
  spec.email         = ["lillian.k.ng@gmail.com"]
  spec.summary       = %q{A Tiny Web Server}
  spec.description   = %q{A Tiny Ninja Web Server}
  spec.homepage      = "https://github.com/orangeninjamidget/ninja_server"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
