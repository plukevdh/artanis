# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'artanis/version'

Gem::Specification.new do |spec|
  spec.name          = "artanis"
  spec.version       = Artanis::VERSION
  spec.authors       = ["Luke van der Hoeven"]
  spec.email         = ["hungerandthirst@gmail.com"]
  spec.summary       = %q{Sinatra, but Reversed!}
  spec.description   = %q{
    Sinatra provides a super simple way to define web apps, or more commonly, simple APIs.
    This gem aims to do the same thing, but for API clients. So now you can write your Sinatra
    and your client in very similar style!
  }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.5"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "pry"

  spec.add_dependency "http", '~> 0.7'
  spec.add_dependency "activesupport", '~> 4.2'
end
