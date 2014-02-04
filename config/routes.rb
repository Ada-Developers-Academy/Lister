Lister::Application.routes.draw do
  
  root 'users#index'
  resources :session

  get '/users'         => 'users#index'
  get  '/users/new'    => 'users#new'
  post '/users'        => 'users#create'

end
