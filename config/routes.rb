require 'resque/server'
Lister::Application.routes.draw do
  mount Resque::Server, :at => "/resque"

  resources :users
  resources :list
  resources :item
  match '/signup',  to: 'users#new',       via: 'get'
  match '/signin',  to: 'session#new',     via: 'get'
  match '/session', to: 'session#create',  via: 'post'
  match '/signout', to: 'session#destroy', via: 'get'
  match '/signout', to: 'session#destroy', via: 'delete'
  root 'welcome#index'

end
