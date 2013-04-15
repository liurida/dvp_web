DvpWeb::Application.routes.draw do

  resources :study_members

  resources :roles

  get "search/index", as: :search

  root :to => 'home#index'
  get "home/index"

  # login
  get "session/new",        as: :session_new
  post "session/create",     as: :session_create
  delete "session/destroy", as: :session_destroy

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
  get "dvp_tool/show_dvp/:dvp_id/:ec_id/show_ec"  => "dvp_tool#show_ec",       as: :show_ec
  get "dvp_tool/show_dvp/:dvp_id/:ec_id/edit_ec"  => "dvp_tool#edit_ec",       as: :edit_ec
  put  "dvp_tool/show_dvp/:dvp_id/:ec_id/update_ec"  => "dvp_tool#update_ec",    as: :update_ec
  delete "dvp_tool/show_dvp/:dvp_id/:ec_id/destroy_ec" => "dvp_tool#destroy_ec", as: :destroy_ec

  #ec_item_comment
  post "dvp_tool/ec_comment/:ec_id/create"           => "dvp_tool#comment_create", as: :ec_comment_create

  get "dvp_tool/list_ecs"                         => "dvp_tool#list_ecs",     as: :list_ecs

  # routes

end
