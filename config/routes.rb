Rails.application.routes.draw do
  root 'top#index'
  post 'push' => 'sms#create'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  post 'callback' => 'line_bot#callback'

  namespace :liff do
    root 'top#index'
    resources :tests
  end

  namespace :api do
    get 'test' => 'test#index'
  end
end
