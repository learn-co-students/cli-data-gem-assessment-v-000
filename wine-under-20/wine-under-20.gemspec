
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wine_under_20/version"

Gem::Specification.new do |spec|
  spec.name          = "wine-under-20"
  spec.version       = WineUnder20::VERSION
  spec.authors       = ["'Nick Lisauskas'"]
  spec.email         = ["'nlisausk@alumni.nd.edu'"]

  spec.summary       = %q{Binny's wine finder.}
<<<<<<< HEAD
  spec.description   = %q{Binny's wine finder.}
=======
  spec.description   = %q{TODO: Write a longer description or delete this line.}
>>>>>>> 7e52c4464d65f0a0fb5a728fea59233b3561aee1
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
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
  spec.add_dependency "nokogiri"
end
