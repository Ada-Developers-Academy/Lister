Lister::Application.routes.draw do

  get "items/new",       to: 'items#new'
  get "items/create",    to: 'items#create'
  get "items/show",      to: 'items#show'
  get "items/index",     to: 'items#index', as: :items
  delete "items/delete", to: 'items#destroy'
  get "items/update",    to: 'items#update'

  get "lists/new",       to: 'lists#new'
  get "lists/create",    to: 'lists#create'
  delete "lists/delete", to: 'lists#destroy'
  get "lists/index",     to: 'lists#index', as: :lists
  get "lists/show",      to: 'lists#show'
  get "lists/update",    to: 'lists#update'

  root 'welcome#index'
  resources :users
  resources :session, only: [:new, :create, :destroy]

  get '/signup',     to: 'users#new'        
  get '/signin',     to: 'session#new', as: :signin
  post '/signin',    to: 'session#create'
  delete '/signout', to: 'session#destroy', as: :signout

end
