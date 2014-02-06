Lister::Application.routes.draw do

  get '/sign_in', to: 'session#new', as: :sign_in
  post '/sign_in', to: 'session#create'
  get '/sign-out', to: 'session#destroy', as: :sign_out

  get '/sign_up', to: 'users#new', as: :new_user
  post '/users/create', to: 'users#create'
  get '/users/:id', to: 'users#show'  

  get '/lists/new', to: 'lists#new', as: :new_list
  post '/lists', to: 'lists#create'
  get '/lists', to: 'lists#index', as: :all_lists
  get '/lists/:id', to: 'lists#show'
 
  
  root to: 'home#index', as: :home
  
end
