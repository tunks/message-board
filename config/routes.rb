Rails.application.routes.draw do
  get "hello_world", to: "hello_world#index"
  resources :users, only: [ :create, :new, :show ]
  # user login and logout route actions
  resources :sessions
  # post message board
  resources :posts

  # user login, signup config routes
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" =>  "sessions#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest


   # Defines the root path route ("/")
   root "posts#index"
end
