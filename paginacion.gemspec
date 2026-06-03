Gem::Specification.new { |spec|
  spec.name = "paginacion"
  spec.version = "0.0.0"
  spec.authors = ["Wenoa Studio"]
  spec.email = ["desarrollo@wenoa.studio"]

  spec.summary = "Un modelo de paginación"
  spec.description = spec.summary
  spec.homepage = "https://github.com/wenoa/ruby-paginacion"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.4"

  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["lib/**/*.rb", "README.md", "LICENSE"]
  spec.require_paths = ["lib"]

  spec.add_dependency "roda"
}
