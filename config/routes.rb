Rails.application.routes.draw do
  devise_for :cooperatives
  devise_for :users
  resources :removal_orders do
    member do
      post :accept
      post :close
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
    resources :removal_orders, only: %i[index]
  end
end
