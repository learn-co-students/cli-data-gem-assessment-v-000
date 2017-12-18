
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "./ALS_news/lib/version"

Gem::Specification.new do |spec|
  spec.name          = "ALS_news"
  spec.version       = ALSNews::VERSION
  spec.authors       = ["'Jacqueline Lee'"]
  spec.email         = ["'anginblu@gmail.com'"]

  spec.summary       = %q{Obtain information on social clips posted on https://alsnewstoday.com.}
  spec.description   = %q{provide a user with a list of social clips and additional options, i.e., search for a particular social clip using a keyword or obtain more information on a particular social clip}
  spec.homepage      = "https://github.com/anginblu/name-cli-app.git"
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
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"

end
