CatarseApi::Engine.routes.draw do
  api_defaults = { format: :json }

  scope :v1 do
    scope :me do
      resources :projects, only: :index, controller: 'me/projects', defaults: api_defaults
    end

    resources :projects, only: [:show], defaults: api_defaults
  end
end
