# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'box_office/version'
require 'nokogiri'
require 'pry'

Gem::Specification.new do |spec|
  spec.name          = "box_office"
  spec.version       = BoxOffice::VERSION
  spec.authors       = ["empireofryan"]
  spec.email         = ["rjohnson2001@gmail.com"]

  spec.summary       = %q{The CLI interface reports the top 5 movies in the box office over the past weekend, along with their respective grosses.}
  spec.homepage      = "https://github.com/empireofryan/CLI-Gem-Movie-Box-Office"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
