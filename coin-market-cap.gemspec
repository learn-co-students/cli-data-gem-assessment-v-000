
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "coin_market_cap/version"

Gem::Specification.new do |spec|
  spec.name          = "da_coin_market_cap"
  spec.version       = CoinMarketCap::VERSION
  spec.authors       = ["Denis Atkesone"]
  spec.email         = ["denis.atkesone@gmail.com"]

  spec.summary       = %q{List top 10 cryptocurrencies.}
  spec.description   = %q{List and view detailed information of the top 10 cryptocurrencies.}
  spec.homepage      = "http://deniscodes.com/"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
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

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

  spec.add_runtime_dependency "nokogiri", "~> 1.8.1"
  spec.add_runtime_dependency "colorize", "~> 0.8.1"
end
