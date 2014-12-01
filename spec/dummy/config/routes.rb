Rails.application.routes.draw do
  mount CatarseApi::Engine => "/api", as: :catarse_api
end
