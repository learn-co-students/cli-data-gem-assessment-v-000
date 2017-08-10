# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'best_companies/version'

Gem::Specification.new do |spec|
  spec.name          = "best_companies"
  spec.version       = BestCompanies::VERSION
  spec.authors       = ["Catherine Cordova"]
  spec.email         = ["ccordova41@gmail.com"]

  spec.summary       = %q{Best Companies to Work for.}
  spec.description   = %q{Provides details on the top companies to work for.}
  spec.homepage      = "http://rubygems.org/gems/best_companies."
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"

end
