CatarseApi::Engine.routes.draw do
  scope :v1, module: :v1, defaults: {format: 'json'} do
    scope :me do
      resources :projects, only: :index, controller: 'me/projects'
    end

    resources :projects, only: [:show] do
      resources :rewards, only: [:index], controller: 'projects/rewards'
      resources :contributions, only: [:index], controller: 'projects/contributions'
    end
  end
end
