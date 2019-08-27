Rails.application.routes.draw do
  devise_for :cooperatives
  devise_for :users
  resources :removal_orders do
    member do
      post 'close'
    end
  end
  resources :garbage_mens
  root to: "home#index"
end
