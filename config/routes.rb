Lister::Application.routes.draw do

  get '/sign_in', to: 'session#new', as: :sign_in
  post '/sign_in', to: 'session#create'

  get '/sign_up', to: 'users#new', as: :new_user
  post '/users/create', to: 'users#create'  

  get '/lists/new', to: 'lists#new', as: :new_list
  post '/lists/create', to: 'lists#create'


  

  root to: 'users#show'
  
end
