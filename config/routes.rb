Rails.application.routes.draw do
  root 'top#index'
  devise_for :applicants
  post 'push' => 'sms#create'
  post 'callback' => 'line_bot#callback'

  namespace :liff do
    root 'top#index'
    post 'users/sign_in' => 'sessions#create'
    resources :tests
    resources :buttons, only: %i[create]
  end

  namespace :api do
    get 'test' => 'test#index'
  end
end
