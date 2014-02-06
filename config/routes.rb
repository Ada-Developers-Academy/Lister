Lister::Application.routes.draw do
  
  root 'lists#index'

  get 'session/new'      => 'session#new',    as: 'sign_in'
  post 'session/create'  => 'session#create', as: 'create_session'

  get 'users/new'        => 'users#new',      as: 'sign_up'
  post 'users/create'    => 'users#create',   as: 'users'
  get 'users/show'       => 'users#show'  

  post 'items/create'    => 'items#create',   as: 'items'
  resources :lists

end
