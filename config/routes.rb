Rails.application.routes.draw do
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  post "/guardian", to: "users#add_guardian"
  post "/ward", to: "wards#create"
  get "/authorized", to: "sessions#show"
  get "/wards", to: "wards#index"
  get "/guardians", to: "users#user_guardians"
  delete "/guardians/:id", to: "guardians#destroy"
  patch "/guardians/:id", to: "guardians#update"
  patch "/wards/", to: "wards#update"
  delete "/wards/:id", to: "wards#destroy"
end
