$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "apo214/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "apo214"
  spec.version     = Apo214::VERSION
  spec.authors     = ["Vladimir Támara Patiño"]
  spec.email       = ["vtamara@pasosdeJesus.org"]
  spec.homepage    = "https://github.com/pasosdeJesus/apo214"
  spec.summary     = "Motor de desaparición para sivel2_gen."
  spec.description = "Agrega elementos para registrar desapariciones a sivel2_gen"
  spec.license     = "ISC"

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "LICENSE.md", "Rakefile", "README.md"]

  spec.add_dependency "rails"
  spec.add_dependency "msip"

  spec.add_development_dependency "pg"
end
