Lister::Application.routes.draw do
  
  require 'resque/server'
  Lister::Application.routes.draw do 
    mount Resque::Server, :at => '/resque'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root   'welcome#index'
  get    'sessions/new'             => 'sessions#new',     as: 'new_session'
  post   'sessions/create'          => 'sessions#create',  as: 'create_session'
  delete 'destroy'                  => 'sessions#destroy', as: 'end_session'

  get    'users/new'                => 'users#new',        as: 'new_user'
  post   'users/create'             => 'users#create',     as: 'create_user'
  get    'users/:id'                => 'users#show',       as: 'user'
  get    'users/:id/lists'          => 'users#show',       to: 'user'

  get    'lists/new'                => 'lists#new',        as: 'new_list'
  post   'lists/create'             => 'lists#create',     as: 'create_list'
  patch  'lists/create'             => 'lists#update'
  get    'lists/:id'                => 'lists#show',       as: 'list'
  get    'edit/:id'                 => 'lists#edit',       as: 'edit'
  get    'users/:user_id/lists/:id' => 'lists#show',       to: 'list'

  get    'items/new'                => 'items#new',        as: 'new_item'
  post   'items/create'             => 'items#create',     as: 'create_item'
  delete 'destroy/item/:id'         => 'items#destroy',    as: 'destroy_item'
  # I know, this is ridiculous. It's just here temporarily because other code was breaking pretty hard. Temporary fix
  get    'destroy/item/:id'         => 'items#destroy',    as: 'destroy_an_item'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  end
end
