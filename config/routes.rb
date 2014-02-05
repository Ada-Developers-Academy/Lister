Lister::Application.routes.draw do

  get "items/new"
  get "items/create"
  get "items/show"
  get "items/index"
  get "items/delete"
  get "items/update"
  get "lists/new"
  get "lists/create"
  get "lists/delete"
  get "lists/index"
  get "lists/show"
  get "lists/update"
  root 'welcome#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get '/signup',  to: 'users#new'        
  get '/signin',  to: 'session#new'
  post '/signin', to: 'session#create'
  delete '/signout', to: 'session#destroy'

end
