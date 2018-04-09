
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "epic_road_trips/version"

Gem::Specification.new do |spec|
  spec.name          = "epic_road_trips"
  spec.version       = EpicRoadTrips::VERSION
  spec.authors       = ["'Dee Race'"]
  spec.email         = ["'deerace12@gmail.com'"]

  spec.summary       = "The Worlds Most Epic Road Trips"
  spec.description   = "Explore and learn more about the worlds most epic road trips published by Fodors Travel Guide."
  spec.homepage      = "https://github.com/Dee-Race/epic-road-trips-cli-gem"
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
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
end
