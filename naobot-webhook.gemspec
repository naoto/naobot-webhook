# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'naobot/webhook/version'

Gem::Specification.new do |spec|
  spec.name          = "naobot-webhook"
  spec.version       = Naobot::Webhook::VERSION
  spec.authors       = ["Naoto SHINGAKI"]
  spec.email         = ["nao.sora+github@gmail.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency 'sinatra'
  spec.add_runtime_dependency 'rinne'
  spec.add_runtime_dependency 'nokogiri'
  spec.add_runtime_dependency 'bubs'
  spec.add_runtime_dependency 'twitter'
  spec.add_runtime_dependency 'weather_jp'
  spec.add_runtime_dependency 'google-search'
end
