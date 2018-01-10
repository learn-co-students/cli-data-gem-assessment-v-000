
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "coffee_roasters/version"

Gem::Specification.new do |spec|
  spec.name          = "coffee_roasters"
  spec.version       = CoffeeRoasters::VERSION
  spec.authors       = ["Miwa"]
  spec.email         = ["paintfx@gmail.com"]

  spec.summary       = "coffee roasters cli gem"
  spec.description   = "the best 21 coffee roasters in the U.S."
  spec.homepage      = "https://github.com/mietone/coffee-roasters-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  # spec.bindir        = "exe"
  spec.executables = ["coffee_roasters"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.11.3"

  spec.add_runtime_dependency "nokogiri", "~> 1.8"
end
