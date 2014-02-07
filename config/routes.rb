Lister::Application.routes.draw do

  resources :items
  resources :lists
  root 'welcome#index'
  resources :users
  resources :session, only: [:new, :create, :destroy]

  get '/signup',     to: 'users#new'        
  get '/signin',     to: 'session#new', as: :signin
  post '/signin',    to: 'session#create'
  get '/signout', to: 'session#destroy', as: :signout

end
