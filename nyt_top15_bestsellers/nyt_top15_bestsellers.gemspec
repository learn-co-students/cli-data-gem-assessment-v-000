
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nyt_top15_bestsellers/version"

Gem::Specification.new do |spec|
  spec.name          = "nyt_top15_bestsellers"
  spec.version       = NytTop15Bestsellers::VERSION
  spec.authors       = ["'Monica Tamaru Jones'"]
  spec.email         = ["'mntamaru@gmail.com'"]

  spec.summary       = "CLI app to tell you current top 15 fiction and non-fiction bestsellers on the New York Times book list."
  spec.description   = "CLI app to tell you current top 15 fiction and non-fiction bestsellers on the New York Times book list. App will scrape data from the NYT website. CLI will ask if user wants price and provide media version (hardcover, kindle, paperback) and price."
  spec.homepage      = "https://github.com/mntjones/nyt-top15-bestsellers"
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
  spec.add_development_dependency "rspec", "~> 3.0"
end
