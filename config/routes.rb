Rails.application.routes.draw do
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  post "/guardian", to: "users#add_guardian"
  post "/ward", to: "wards#create"
  get "/authorized", to: "sessions#show"
  get "/wards", to: "wards#index"
  get "/guardians", to: "users#user_guardians"
  delete 'guardian/:guardian_id', to: 'users#destroy_guardian'
  patch "/guardians/:id", to: "guardians#update"
  patch "/ward", to: "wards#update"
  delete "/ward/:id", to: "wards#destroy"
end
