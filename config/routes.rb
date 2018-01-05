Rails.application.routes.draw do


  resources :imports
  get '/imports/doimport/*ipath' => 'imports#doimport', as: 'ipath'
  
  resources :infohash_members
  root to: "mainpage#index"
  
  scope format: true, defaults: { format: 'html' } do
     devise_for :users, controllers: {registrations: "registrations", passwords: "passwords"}
  end
  
  #namespace :api, defaults: {format: 'json'} do
  namespace :api do
    namespace :v1 do
      resources :publications
      resources :gfiles
      #get 'publications/show', to: 'publications#show', defaults: { format: :json }, as: :job
    end
  end

  resources :infohash_members
  resources :identifications  
  
  resources :supervisions
  
  resources :evaluations do
      resources :qualis_evaluate_journasl
  end
  resources :weblinks
  resources :grants

  resources :institutions

  #resources :publication_profiles
  #resources :infohash_users
  
  get '/u/:username' => 'profiles#username', as: 'username' #creates username_path
  
  resources :profiles do
    resources :positions do
      resources :activities
    end
  end
  
  get '/g/:groupname' => 'groups#groupname', as: 'groupname' #creates groupname_path
    
  resources :groups do
      resources :group_users
  end
  
  get '/h/:code' => 'infohashes#code'
  
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

  get '/userpublications/:uname' => 'publications#indexbyuser', as: 'uname'
  get '/grouppublications/:gname' => 'publications#indexbygroup', as: 'gname'
  get '/f/:fcode' => 'gfiles#getfile', as: 'fcode'
  
  resources :publications do
    resources :publication_profiles
  end
  
  resources :infohashes do
    resources :infohash_users
    resources :attachments
  end
  
  
  resources :visibilities

  #get 'imports/' => 'imports#new'  
  #get 'imports/:url' => 'imports#view'

  
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
