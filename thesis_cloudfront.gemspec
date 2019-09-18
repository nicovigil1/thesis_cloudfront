lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "thesis_cloudfront/version"

Gem::Specification.new do |spec|
  spec.name          = "thesis_cloudfront"
  spec.version       = ThesisCloudfront::VERSION
  spec.authors       = ["Nico Vigil"]
  spec.email         = ["nicovigil1@gmail.com"]

  spec.summary       = %q{Adds a generator to add rack cors and configures it to fit our workflow}
  spec.description   = %q{Adds cloudfront configuration to applications}
  spec.homepage      = "https://github.com/nicovigil1/thesis_cloudfront"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/nicovigil1/thesis_cloudfront"
  spec.metadata["changelog_uri"] = "https://github.com/nicovigil1/thesis_cloudfront/blob/master/README.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
