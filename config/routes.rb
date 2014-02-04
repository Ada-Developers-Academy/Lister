require 'resque/server'
Lister::Application.routes.draw do
  mount Resque::Server, :at => "/resque"

  root to: "users#show"

  get  "/signin" =>"sessions#new", as: :sign_in
  post "/signin" =>"sessions#create"

  get  "/signup" =>"users#new", as: :new
  post "/signup" => "users#create"
  get "/users" => "users#show", as: :users
  get "/user/:id" => "users#show", as: :user


  resources :lists, :items

end
