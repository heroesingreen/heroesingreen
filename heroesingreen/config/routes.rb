ActionController::Routing::Routes.draw do |map|
  map.resources :levels

  map.resources :plant_templates

  map.resources :gardens

  #map.resources :users
  map.devise_for :users

  map.user_root 'account/home', :controller => 'account', :action => 'home'

  map.resources :missions, :member => { :show_mission_in_a_box => :get }

  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  map.current_missions 'mission_game/current_missions', :controller => 'mission_game', :action => 'current_missions'

  map.find_mission 'mission_game/find_mission', :controller => 'mission_game', :action => 'find_mission'

  #map.resources :mission_games, :member => { :accept => :post }

  map.connect 'signup/v2', :controller => 'signup', :action => 'v2'
  map.resources :signup

  map.resources :plants, :only => [:destroy]

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  #map.root :controller => "account", :action => "home"
  map.root :controller => "signup"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
