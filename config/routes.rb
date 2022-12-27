Rails.application.routes.draw do
  root 'top#index'
  resources :users, only: %i[new create]
  post 'callback' => 'line_bot#callback'

  namespace :liff do
    root 'top#index'
  end
end
