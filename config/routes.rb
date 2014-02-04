Lister::Application.routes.draw do

  root 'welcome#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get '/signup',  to: 'users#new'        
  get '/signin',  to: 'session#new'
  post '/signin', to: 'session#create'
  delete '/signout', to: 'session#destroy'

end
