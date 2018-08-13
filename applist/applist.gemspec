
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "applist/version"

Gem::Specification.new do |spec|
  spec.name          = "applist"
  spec.version       = Applist::VERSION
  spec.authors       = ["'Everett'"]
  spec.email         = ["'everett.bowline@gmail.com'"]

  spec.summary       = %q{Creates a list of free apps available on the Apple app store.}
  spec.description   = %q{Creates a list of free apps available on the Apple app store.}
  spec.homepage      = "https://github.com/Evbw/CLI-Data-Gem-Applist"
  spec.license       = "MIT"

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
  spec.bindir        = "bin"
  spec.executables   = ["applist"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake-release"
  spec.add_development_dependency "gem-release"
  
  spec.add_dependency "nokogiri"
end
