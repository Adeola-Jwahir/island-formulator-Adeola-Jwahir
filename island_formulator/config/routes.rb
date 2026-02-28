Rails.application.routes.draw do
  # The root route is the "homepage" of your application.
  # By setting it to dashboards#show, users will see their dashboard
  # immediately after logging in.
  root "dashboards#show"
  
  get "dashboards/show"
  
  # Authentication routes (from Week 2)
  resource :session
  resources :users, only: [:new, :create]
  resources :passwords, param: :token
  
  # Existing resources
  resources :ingredients
  resources :recipes
  
  # New Week 4 resources
  resources :inventory_items
  resources :batches, only: [:index, :show, :new, :create, :destroy]
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
