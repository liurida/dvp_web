DvpWeb::Application.routes.draw do
  get "home/index"

  # login
  get "session/new",        as: :session_new
  post "session/create",     as: :session_create
  delete "session/destroy", as: :session_destroy

  #devise_for :users

  resources :ec_items


  resources :domains

  get "dvps/:id/batch_ec" => "dvps#batch_ec", as: :batch_ec
  resources :dvps do
    member do
      #match 'ec_create' => 'dvps#ec_create'
      post 'ec_copy' => 'dvps#ec_copy'
    end
  end


  resources :studies

  #Match thumbnailphoto
  get '/serve_images/:login_id' => 'images#serve'

  # Study DVP routes
  get "dvp_tool/show_study/:study_id"             => "dvp_tool#show_study",   as: :show_study
  get "dvp_tool/show_study/:study_id/new_dvp"     => "dvp_tool#new_dvp",      as: :new_dvp
  post "dvp_tool/show_study/:study_id/create_dvp" => "dvp_tool#create_dvp",   as: :create_dvp

  #get "dvp_tool/list_dvps"                        => "dvp_tool#list_dvps",    as: :list_dvps
  get "dvp_tool/show_dvp/:dvp_id"                 => "dvp_tool#show_dvp",     as: :show_dvp
  get "dvp_tool/show_dvp/:dvp_id/new_ec"          => "dvp_tool#new_ec",       as: :new_ec
  post "dvp_tool/show_dvp/:dvp_id/create_ec"      => "dvp_tool#create_ec",    as: :create_ec
  get "dvp_tool/show_dvp/:dvp_id/:ec_id/edit_ec"  => "dvp_tool#edit_ec",       as: :edit_ec
  put  "dvp_tool/show_dvp/:dvp_id/:ec_id/update_ec"  => "dvp_tool#update_ec",    as: :update_ec
  delete "dvp_tool/show_dvp/:dvp_id/:ec_id/destroy_ec" => "dvp_tool#destroy_ec", as: :destroy_ec

  get "dvp_tool/list_ecs"                         => "dvp_tool#list_ecs",     as: :list_ecs
  get "dvp_tool/show_ec/:ec_id"                   => "dvp_tool#show_ec",      as: :show_ec

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
