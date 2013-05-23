ActionController::Routing::Routes.draw do |map|
  map.resources :users
  map.resources :events
  map.verify_users '/verify/:id/:passcode', :controller => "users", :action => "verify"
  map.edit_users '/edit_user', :controller => "users", :action => "edit_user", :method => :post
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
  #map.root :controller => "users",:action => "welcome"
  map.root :controller => "users",:action => "index"
  map.home "/home", :controller => "users",:action => "index"

  map.admin_home "admin",:controller => "admin", :action => "index"
  map.admin_user_notification "admin/notification",:controller => "admin", :action => "user_notification"
  map.admin_send_notification "admin/send_notification",:controller => "admin", :action => "send_notification"
  map.admin_manage_event_users "admin/event/:id/manage_users",:controller => "admin", :action => "manage_event_users"
  map.admin_delete_user "admin/delete_user/:id",:controller => "admin", :action => "delete_user"
  map.show_feed_back_form "feed_back",:controller => "users", :action => "show_feed_back_form"
  map.submit_feed_back_form "feed_back/submit",:controller => "users", :action => "submit_feed_back_form"

  map.delete_event "event/delete/:id", :controller => "events", :action => "destroy"
  #map.admin_event "admin/event",:controller => "events", :action => "index"
  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
