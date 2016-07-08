Rails.application.routes.draw do

  root to: "mainpage#index"
  
  devise_for :users
  
  resources :supervisions
  
  resources :evaluations do
      resources :qualis_evaluate_journasl
  end
  resources :weblinks
  resources :grants

  resources :institutions

  #resources :publication_profiles
  #resources :infohash_users
  resources :profiles do
    resources :positions do
      resources :activities
    end
  end
  resources :reminders
  resources :posts
  #resources :htypes
  resources :instances
  resources :tags
  #resources :inforelations
  resources :gfiles
  #resources :pubtypes

  resources :folders do
      resources :folder_infohashes
  end
  
  resources :projects do
    resources :project_profiles
  end
  
  resources :publications do
    resources :publication_profiles
  end
  
  resources :infohashes do
    resources :infohash_users
  end
  
  resources :groups do
      resources :group_users
  end
  
  
  resources :visibilities
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
