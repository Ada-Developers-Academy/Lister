require 'resque/server'
Lister::Application.routes.draw do

  mount Resque::Server, :at => "/resque" 
  
  root "lists#index"
  get "/new", to: "users#new"
  post "users/new", to: "users#create", as: :users
  get "/profile", to: "users#show" #instead of :id?
  get "/signup", to: "users#new"

  get "/signout", to: "sessions#destroy"
  get '/login', to: "sessions#new"
  post "/login", to: "sessions#create", as: :sessions

  get "/lists/new", to: "lists#new", as: :list_new
  post "/lists/new", to: "lists#create", as: :lists
  get "/lists", to: "lists#index", as: :all_lists
  get "/lists/:id", to: "lists#show", as: :current_list

  get "/items/new", to: "items#new", as: :item_new
  post "/items/new", to: "items#create", as: :items
  delete "/items/:id", to: "items#delete", as: :destroy_item

  # resources :lists


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
