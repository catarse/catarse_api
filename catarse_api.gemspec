$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "catarse_api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "catarse_api"
  s.version     = CatarseApi::VERSION
  s.authors     = ["Ton"]
  s.email       = ["ton@catarse.me"]
  s.homepage    = "https://github.com/catarse/catarse_api"
  s.summary     = "Experimental API"
  s.description = "Experimental API."
  s.license     = "MIT"

  s.files      = `git ls-files`.split($\)
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency 'active_model_serializers', '0.8.0'
  s.add_dependency 'has_scope'
  s.add_dependency 'kaminari'

  s.add_development_dependency "rspec-rails", "~> 2.14.0"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "draper"
  s.add_development_dependency "pg"
  s.add_development_dependency 'rspec_api_documentation'
  s.add_development_dependency 'json_spec'
end
