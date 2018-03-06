
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "easy_vegan/version"

Gem::Specification.new do |spec|
  spec.name          = "easy_vegan"
  spec.version       = EasyVegan::VERSION
  spec.authors       = ["'Aubrey Neimeier'"]
  spec.email         = ["'neimeier.1@osu.edu'"]

  spec.summary       = %q{Quickly browse hundreds of easy vegan recipes!}
  spec.description   = %q{ Follow the prompts to browse hundreds of vegan recipes! After selecting a category of recipes, relevant recipes will be displayed to browse further details. The following details are available for each recipe; title, recipe category, cuisine category, serving size, and the recipe url. All recipe information has been scraped from a lovely food blog, titled "Minimalist Baker".}
  spec.homepage      = "https://github.com/AubreyNeimeier/easy_vegan"
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
end
