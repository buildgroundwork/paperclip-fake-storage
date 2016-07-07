# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paperclip-fake-storage/version'

Gem::Specification.new do |spec|
  spec.name          = "paperclip-fake-storage"
  spec.version       = PaperclipFakeStorage::VERSION
  spec.authors       = ["Adam Milligan"]
  spec.email         = ["adam@buildgroundwork.com"]
  spec.summary       = %q{Fake storage for testing classes with Paperclip attachments}
  spec.description   = %q{}
  spec.homepage      = "http://buildgroundwork.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "paperclip", "~> 5.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end

