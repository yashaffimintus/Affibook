Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: "users/registrations" }
  root 'profiles#dashboard'
  #get 'users/new'
  get 'users/myuser'
  get 'posts/index'
  get "users/user_id/profiles/new" => "profiles#new"
  get "users/user_id/profiles/id" => "profiles#show"
  post 'users/new'
  get 'profiles/new'
  #get 'users/dashboard'
   #get 'profiles/dashboard'
   get 'users/follow'
   get 'users/user_id/profiles'
   #get "relationships/follow"
   get "relationships/id"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :users do
  resources :profiles
end
  
  resources :friendships
  resources :posts do
    resources :comments
  end
   resources :relationships
  # You can have the root of your site routed with "root"
  
  get "profiles/:id" => "users#show"
  
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
