Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :immunizations
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  post "/guardian", to: "guardians#create"
  post "/ward", to: "wards#create"
  get "/authorized", to: "sessions#show"
  get "/wards", to: "wards#index"
  get "/guardians", to: "users#user_guardians"
  delete 'guardian/:guardian_id', to: 'guardians#destroy'
  patch "/guardians/:id", to: "guardians#update"
  patch "/ward", to: "wards#update"
  patch "/immunization", to: "immunizations#update"
  delete "/ward/:id", to: "wards#destroy"
end
