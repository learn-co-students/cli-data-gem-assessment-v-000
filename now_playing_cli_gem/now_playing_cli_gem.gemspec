
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "now_playing_cli_gem/version"

Gem::Specification.new do |spec|
  spec.name          = "now_playing_cli_gem"
  spec.version       = NowPlayingCliGem::VERSION
  spec.authors       = ["'Blake Balbirnie'"]
  spec.email         = ["'blakebalbirnie@gmail.com'"]

  spec.summary       = %q{Movies now playing}
  spec.description   = %q{Movies now playing}
  spec.homepage      = "https://github.com/BlakeBalbirnie/cli-data-gem-assessment-v-000"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "lib/now_playing_cli_gem"]
  spec.license       = "MIT"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "nokogiri"
end
