Rails.application.routes.draw do
  get 'finances/index'

  get 'finances/show'

  get 'sessions/new'

  get    'finances/us_search/:id' => 'finances#u_search', as: 'u_search'

  get    'orderinfos'      => 'orderinfos#index'

  get    'orderinfos/:id'  => 'orderinfos#show'

  get    'orders/:id'      => 'orders#show', as: 'order'

  root   'pages#home'

  get    'users/new'       =>  'users#new', as: 'signup'

  get    'users/:id'       =>  'users#show', as: 'user'
  
  get    'users'           =>  'users#index'

  get    'users/:id/edit'  =>  'users#edit'

  get    'accounts/new', as: 'create_account'

  get    'accounts/:id/edit'   =>  'accounts#edit', as:'change_password'

  get    'accounts/:id'    =>  'accounts#show', as: 'account'

  get    'orders'          =>  'orders#index'

  get    'login'           =>  'sessions#new'

  post   'login'           =>  'sessions#create'

  delete 'logout'          =>  'sessions#destroy'

  namespace :api do
    get 'finances/search'           =>  'finances#search'
    get 'finances/count'            =>  'finances#count'
    resources :finances
  end

  resources :users, :accounts, :orders, :orderinfos
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
