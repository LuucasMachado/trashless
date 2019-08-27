Rails.application.routes.draw do
  devise_for :cooperatives
  devise_for :users
  resources :removal_orders
  resources :garbage_men
  root to: "home#index"
end
