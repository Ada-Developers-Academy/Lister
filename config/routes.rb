require 'resque/server'
Lister::Application.routes.draw do
 mount Resque::Server.new, :at => "/resque"

  root to: "users#show"

  get  "/signin" =>"sessions#new", as: :sign_in
  post "/signin" =>"sessions#create"
  get  "/signup" =>"users#new", as: :new
  post "/signup" => "users#create"
  delete "/signout" => "sessions#destroy", as: :signout
  get "/users" => "users#show", as: :users
  get "/user/:id" => "users#show", as: :user
  get "/mylists" => "lists#users_lists", as: :my_lists

  resources :lists do
     resources :items
  end

end
