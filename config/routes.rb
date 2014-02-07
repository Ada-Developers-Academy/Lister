require 'resque/server'
Lister::Application.routes.draw do
  mount Resque::Server, :at => "/resque"
  
  
  get '/signup'     => 'users#new',       as: :signup
  get '/login'      => 'session#new',     as: :login
  post '/login'     => 'session#create'
  delete '/logout'  => 'session#destroy', as: :logout

  get '/users'      => 'users#index'
  post '/users'     => 'users#create'

  get '/users/:id'  => 'users#show',      as: :user

  resources :lists

  root 'lists#index'

end
