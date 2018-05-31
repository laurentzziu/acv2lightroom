# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "acv2lrtemplate/identity"

Gem::Specification.new do |spec|
  spec.name = Acv2lrtemplate::Identity.name
  spec.version = Acv2lrtemplate::Identity.version
  spec.platform = Gem::Platform::RUBY
  spec.authors = ["Florinel Gorgan"]
  spec.email = ["florin@floringorgan.com"]
  spec.homepage = "https://github.com/laurentzziu/acv2lrtemplate"
  spec.summary = "Easily convert .acv (Photoshop Curves) to .lrtemplate (Adobe Lightroom Preset) files."
  spec.license = "MIT"

  if File.exist?(Gem.default_key_path) && File.exist?(Gem.default_cert_path)
    spec.signing_key = Gem.default_key_path
    spec.cert_chain = [Gem.default_cert_path]
  end

  spec.required_ruby_version = "~> 2.4"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "gemsmith", "~> 10.3"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "pry-byebug", "~> 3.4"
  spec.add_development_dependency "pry-state", "~> 0.1"
  spec.add_development_dependency "rspec", "~> 3.6"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "rubocop", "~> 0.49"

  spec.add_dependency "curver", "~> 0.0.2"
  spec.add_dependency "thor", '~> 0.20'
  spec.add_dependency "paint", "~> 2.0", ">= 2.0.1"

  spec.files = Dir["lib/**/*"]
  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]
  spec.require_paths = ["lib"]
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
end
