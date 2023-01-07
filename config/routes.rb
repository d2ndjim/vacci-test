Rails.application.routes.draw do
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  post "/guardian", to: "users#add_guardian"
  post "/ward", to: "wards#create"
  get "/authorized", to: "sessions#show"
  get "/wards", to: "wards#index"
  delete "/guardians/:id", to: "guardians#destroy"
  patch "/guardians/:id", to: "guardians#update"
  delete "/wards/:id", to: "wards#destroy"
end
