Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/sidekiq'

  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  post "/ward", to: "wards#create"
  get "/authorized", to: "sessions#show"
  get "user/wards", to: "wards#index"
  get "/vaccines", to: "vaccines#index"
  get "/reminder", to: "immunizations#reminder_days"
  get "/ward/:id", to: "wards#user_child"
  get "/upcoming", to: "immunizations#upcoming"
  patch "/ward", to: "wards#update"
  patch "/user/update", to: "users#update"
  patch "/ward/:ward_id/vaccine/:id", to: "vaccines#update"
  patch "/immunization", to: "immunizations#update"
  delete "/ward/:id", to: "wards#destroy"
end
