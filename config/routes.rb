Rails.application.routes.draw do
  devise_for :cooperatives
  devise_for :users
  root to: "home#index"
  resources :removal_orders do
    resources :removal_order_problems, only: [:create]
    member do
      post :accept
      post :close
      post :close_coop
    end
    collection do
      get :finished
    end
  end
  resources :garbage_men do
    member do
      post :close
    end
  end
  root to: "home#index"
  namespace :cooperatives do
    resources :removal_orders , only: %i[index]
  end
  resources :garbage_men
end
