Rails.application.routes.draw do
  devise_for :cooperatives
  devise_for :users
  root to: "home#index"
  resources :removal_orders do
    resources :removal_order_problems, only: [:create]
    member do
      post :accept
      post :close
    end
    collection do
      get :finished
    end
  end
  namespace :cooperatives do
    resources :removal_orders , only: %i[index]
  end
  resources :garbage_men
end
