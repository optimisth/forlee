Rails.application.routes.draw do
  get 'home/:list_title' => 'home#list', :as => 'home_list'
  get 'home/:list_title/:bulletin_title' => 'home#bulletin', :as => 'home_bulletin'
  get 'home/:list_title/:bulletin_title/:id' => 'home#post', :as => 'home_post'
  get 'home' => 'home#index', :as => 'home_index'

  root 'welcome#index'
  get 'about' => 'home#about', :as => 'home_about'


  get 'admin' => 'admin/lists#index'
  namespace :admin do
    resources :lists do
        resources :bulletins do
          resources :posts do
            resources :videos
          end
        end
    end
    resources :post_attachments
    resources :abouts
  end

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
