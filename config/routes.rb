Rails.application.routes.draw do
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  get "/authorized", to: "sessions#show"
  post "/create/guardian", to: "users#add_guardian"
  delete "guardians/:id", to: "guardians#destroy"
  
end
