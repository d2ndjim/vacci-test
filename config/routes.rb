Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :immunizations

  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  post "/ward", to: "wards#create"
  post "/upload/avatar", to: "users#upload_avatar"
  get "/authorized", to: "sessions#show"
  get "user/wards", to: "wards#index"
  get "/vaccines", to: "vaccines#index"
  get "/immunizations", to: "immunizations#index"
  get "/upcoming", to: "immunizations#upcoming"
  patch "/ward", to: "wards#update"
  patch "/immunization", to: "immunizations#update"
  delete "/ward/:id", to: "wards#destroy"
end
