Lister::Application.routes.draw do

  get  "/signin" =>"sessions#new", as: :sign_in
  post "/signin" =>"sessions#create"

  get  "/signup" =>"users#new", as: :new
  post "/signup" => "users#create"
  get "/users" => "users#show", as: :users
  get "/user/:id" => "users#show", as: :user

  root to: "users#show"
end
