Lister::Application.routes.draw do
  
  root 'session#new'

  get 'session/new'      => 'session#new',    as: 'sign_in'
  post 'session/create'  => 'session#create', as: 'create_session'

  get 'users/new'        => 'users#new',      as: 'sign_up'
  post 'users/create'    => 'users#create',   as: 'create_user'
  get 'users/show'       => 'users#show',     as: 'show_user'

  post 'items/new'       => 'items#new',      as: 'new_item'
  patch 'items/update'   => 'items#update',   as: 'update_item'
  delete 'items/destroy' => 'items#destroy',  as: 'destroy_item'

  resources :lists

end
