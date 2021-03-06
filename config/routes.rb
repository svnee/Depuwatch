ChdTransparent::Application.routes.draw do
  resources :ratings

  constraints :subdomain => "api" do
    resources :politicians
  end
  
  namespace :api do resources :politicians end

  resources :legislations

	get "admin/cache_percentages"
	get "admin/purge_cache"
	get "admin/cache_active"
  get "admin/vote"
  get "admin/calculate_favs"
  match "admin/save_votes" => 'admin#save_votes'

  match 'report_sent' => 'static#report_sent'
  match 'report' => 'static#report'
  match 'feedback' => 'static#feedback'
  match 'missing' => 'static#missing'
  match 'search' => 'static#search'
  match 'featured' => 'static#featured'
  match 'results/deputies' => 'static#results_deputies'
  match 'results/texts' => 'static#results_texts'
  
  resources :reports

  resources :memberships

  resources :text_topics

  resources :topics
  
  
  match 'info' => 'static#info'
  match 'index' => 'static#index'
  match 'faq' => 'static#faq'
  match 'contact' => 'static#contact'
  match 'license' => 'static#license'
  match 'disclaimer' => 'static#disclaimer'

  get "user_session/new"

  get "user_session/create"

  get "user_session/destroy"

  resources :users

  resources :sessions

  resources :seances

  resources :texts

  resources :votes

  resources :deputies

  resources :parties

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "static#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
