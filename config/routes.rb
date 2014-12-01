CatarseApi::Engine.routes.draw do
  scope :v1, module: :v1, defaults: {format: 'json'} do
    scope :me do
      resources :projects, only: :index, controller: 'me/projects'
    end

    resources :projects, only: [:show]
  end
end
