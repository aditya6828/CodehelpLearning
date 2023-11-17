Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'users#new'
  # get 'users/new', to: 'users#new', as: 'new_user'
  post 'users', to: 'users#create'

  get 'verify_email/:token', to: 'users#verify_email', as: 'verify_email'

  get 'verify_otp/:id', to: 'sessions#verify_otp', as: 'verify_otp'

  # resources :users, only: [:new, :create] do
  #   member do
  #     get 'verify_email/:token', to: 'users#verify_email', as: 'verify_email'
  #   end
  # end

  # resources :password_resets, only: [:new, :create]

  # resources :sessions, only: [:new, :create] do
  #   collection do
  #     get 'verify_otp/:id', to: 'sessions#verify_otp', as: 'verify_otp'
  #   end
  # end

end
