Rails.application.routes.draw do
  devise_for :cooperatives
  devise_for :users
  root to: 'home#index'
  resources :removal_orders
  resources :collectors
end
