module CatarseApi
  class Engine < ::Rails::Engine
    isolate_namespace CatarseApi

    config.autoload_paths << File.expand_path("../app/serializers/", __FILE__)
  end
end
