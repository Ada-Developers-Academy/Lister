Lister::Application.routes.draw do
  
  root 'users#index'
  resources :session, only: [:new, :create]
  resources :users, only: [:index, :new, :create, :show]

  # get '/users'         => 'users#index'
  # get  '/users/new'    => 'users#new'
  # post '/users'        => 'users#create'

end
