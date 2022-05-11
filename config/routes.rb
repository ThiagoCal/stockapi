Rails.application.routes.draw do
  resources :stocks
  devise_for :users
  root to: 'pages#index'

  post "/" => 'pages#index'
end
