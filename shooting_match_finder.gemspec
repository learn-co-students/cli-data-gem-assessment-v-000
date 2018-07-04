
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "shooting_match_finder/version"

Gem::Specification.new do |spec|
  spec.name          = "shooting_match_finder"
  spec.version       = ShootingMatchFinder::VERSION
  spec.authors       = ["'Branden Mosley'"]
  spec.email         = ["'branden.mosley1337@gmail.com'"]

  spec.summary       = "Find all the shooting competitions near you!"
  spec.description   = "This RubyGem presents a list of shooting competitions in your area by scraping
                        https://practiscore.com/search/matches"
  spec.homepage      = "https://github.com/Almighty-Mose/shooting-match-finder"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
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

  spec.add_runtime_dependency "nokogiri"
end
