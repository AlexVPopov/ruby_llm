# ruby_llm.gemspec
require_relative 'lib/ruby_llm/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_llm"
  spec.version       = RubyLLM::VERSION
  spec.authors       = ["Carmine Paolino"]
  spec.email         = ["carmine@paolino.me"]

  spec.summary       = %q{The Ruby LLM client library - unified interface for OpenAI, Anthropic, and other LLM providers}
  spec.description   = %q{Complete Ruby library for working with Large Language Models (LLMs). Supports OpenAI, Anthropic,
    and others with a consistent interface. Features include tool usage, token tracking, and seamless Rails integration.}
  spec.homepage      = "https://github.com/crmne/ruby_llm"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "https://rubydoc.info/gems/ruby_llm"
  spec.metadata["bug_tracker_uri"] = "#{spec.homepage}/issues"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_dependency "faraday", ">= 2.0"
  spec.add_dependency "faraday-multipart", ">= 1.0"
  spec.add_dependency "zeitwerk", ">= 2.6"

  # Optional Rails dependencies
  spec.add_dependency "activesupport", ">= 6.0", "< 9.0", optional: true
  spec.add_dependency "activerecord", ">= 6.0", "< 9.0", optional: true

  # Development dependencies
  spec.add_development_dependency "bundler", ">= 2.0"
  spec.add_development_dependency "rake", ">= 13.0"
  spec.add_development_dependency "rubocop", ">= 1.0"
  spec.add_development_dependency "yard", ">= 0.9"
  spec.add_development_dependency "simplecov", ">= 0.21"
  spec.add_development_dependency "pry", ">= 0.14"
  spec.add_development_dependency "overcommit"
end
