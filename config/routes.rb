Rails.application.routes.draw do

  

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show"

  # Defines the root path route ("/")
  # root "posts#index"
  root 'users#new'
  get '/', to: 'users#new'
  # get 'users/new', to: 'users#new', as: 'new_user'
  post 'users', to: 'users#create'

  get '/confirmEmail', to: 'confirm_email#verify_otp'
  post '/confirm_email/verify_otp', to: 'confirm_email#verify_otp', as: :verify_otp

  get '/create', to: 'users#create'

  get 'verify_email/:token', to: 'users#verify_email'

  get 'verify_otp/:id', to: 'sessions#verify_otp'

  get '/sessions/new', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/sessions/verify_otp', to: 'sessions#verify_otp'
  post '/sessions/verify_otp', to: 'sessions#verify_otp'

  # resources :password_resets, only: [:new, :create]

  # resources :sessions, only: [:new, :create] do
  #   collection do
  #     get 'verify_otp/:id', to: 'sessions#verify_otp', as: 'verify_otp'
  #   end
  # end
  get 'courses', to: 'users#courses'
  post 'courses', to: 'users#create_course'

  


end
