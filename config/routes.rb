require 'resque/server'

Lister::Application.routes.draw do

  mount Resque::Server, :at => "/resque"
  
  root 'lists#index'

  get 'session/new' => 'session#new',     as: 'sign_in'
  post 'session'    => 'session#create',  as: 'create_session'
  get 'session'     => 'session#destroy', as: 'sign_out'

  get 'users/new'   => 'users#new',       as: 'sign_up'
  post 'users'      => 'users#create',    as: 'users'
  get 'users/show'  => 'users#show'  

  post 'items'      => 'items#create',    as: 'items'

  resources :lists

end
