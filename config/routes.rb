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

  post 'items/new'       => 'items#new',      as: 'new_item'
  patch 'items/update'   => 'items#update',   as: 'update_item'
  delete 'items/destroy' => 'items#destroy',  as: 'destroy_item'

  resources :lists

end
