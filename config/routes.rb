Rails.application.routes.draw do
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  get "/authorized", to: "sessions#show"
  post "/create/guardian", to: "users#add_guardian"
  delete "/guardians/:id", to: "guardians#destroy"
  put "/guardians/:id", to: "guardians#update"
  get "/wards", to: "wards#index"
  post "/new/ward", to: "wards#create"
  
end
