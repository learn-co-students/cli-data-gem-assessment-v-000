
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nyt_bestsellers/version"

Gem::Specification.new do |spec|
  spec.name          = "nyt_bestsellers"
  spec.version       = NytBestsellers::VERSION
  spec.authors       = ["'Monica Tamaru Jones'"]
  spec.email         = ["'mntamaru@gmail.com'"]

  spec.summary       = "This gem scrapes the New York Times website and lists the book bestsellers in fiction and nonfiction, with authors and time on the list."
  spec.description   = "The top 15 fiction and non-fiction books from the New York Times website will be displayed, along with the author and time on the list. The list will be shown for combined ebook and print editions."
  spec.homepage      = "https://github.com/mntjones/nyt-bestsellers"
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
