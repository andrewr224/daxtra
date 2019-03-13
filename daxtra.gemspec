# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "daxtra/version"

Gem::Specification.new do |spec|
  spec.name          = "daxtra"
  spec.version       = Daxtra::VERSION
  spec.authors       = ["andrew_r"]
  spec.email         = ["andrew.r224@gmail.com"]

  spec.summary       = "Write a short summary, because RubyGems requires one."
  spec.description   = "Write a longer description or delete this line."
  spec.homepage      = "https://github.com/andrewr224/daxtra"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`
      .split("\x0")
      .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.5.0"

  spec.add_dependency "faraday", "~> 0.15.2"

  spec.add_development_dependency "bundler",       "~> 1.17"
  spec.add_development_dependency "pry",           "~> 0.12"
  spec.add_development_dependency "rack-test",     "~> 1.1"
  spec.add_development_dependency "rake",          "~> 10.0"
  spec.add_development_dependency "rspec",         "~> 3.0"
  spec.add_development_dependency "rubocop",       "~> 0.65"
  spec.add_development_dependency "rubocop-rspec", "~> 1.32"
  spec.add_development_dependency "vcr",           "~> 4.0"
  spec.add_development_dependency "webmock",       "~> 3.5"
end
