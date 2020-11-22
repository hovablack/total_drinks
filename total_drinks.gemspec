require_relative 'lib/total_drinks/version'

Gem::Specification.new do |spec|
  spec.name          = "total_drinks"
  spec.version       = TotalDrinks::VERSION
  spec.authors       = ["hovablack"]
  spec.email         = ["nevermind92@hotmail.com"]

  spec.summary       = %q{Pick from a List of cocktails.}
  spec.description   = %q{Total Drinks give you a list of cocktails to choose from, giving you details about each one chosen.}
  spec.homepage      = "https://rubygems.org"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://rubygems.org"
  spec.metadata["changelog_uri"] = "https://rubygems.org"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
