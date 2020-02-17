require_relative 'lib/nyt_bestsellers_list/version'

Gem::Specification.new do |spec|
  spec.name          = "nyt_bestsellers_list"
  spec.version       = NytBestsellersList::VERSION
  spec.authors       = ["<github username>"]
  spec.email         = ["<github email address>"]

  spec.summary       = %q"This gem will scrape the Bestsellsers lists from the New York Times Websites"
  spec.homepage      = "https://github.com/sjgarza22/nyt-bestsellers-list.git"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sjgarza22/nyt-bestsellers-list.git"
  spec.metadata["changelog_uri"] = "https://github.com/sjgarza22/nyt-bestsellers-list.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # spec.add_development_dependency 'bundler'
  # spec.add_development_dependency 'rake'
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
