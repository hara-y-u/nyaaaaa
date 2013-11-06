# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nyaaaaa/version'

Gem::Specification.new do |spec|
  spec.name          = "nyaaaaa"
  spec.version       = Nyaaaaa::VERSION
  spec.authors       = ["yukihiro hara"]
  spec.email         = ["yukihr@gmail.com"]
  spec.description   = %q{Cats fix everything in your life.}
  spec.summary       = %q{You need cat image.}
  spec.homepage      = "http://yukihr.github.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "addressable"
  spec.add_development_dependency "launchy"
end
