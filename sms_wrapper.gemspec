# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sms_wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "sms_wrapper"
  spec.version       = SmsWrapper::VERSION
  spec.authors       = ["Ivan Piliaiev"]
  spec.email         = ["piliaiev@gmail.com"]
  spec.summary       = %q{Wrapper for sms gates.}
  spec.description   = %q{Wrapper for sms gates.}
  spec.homepage      = "https://github.com/dancingbytes/sms_wrapper"
  spec.license       = "BSD"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

end
