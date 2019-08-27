Rails.application.routes.draw do
  devise_for :cooperatives
  devise_for :users
  resources :removal_orders do 
    collection do
      get 'finished'
    end  
  end  

  resources :garbage_mens
  root to: "home#index"
  namespace :cooperatives do
    resources :removal_orders , only: %i[index]
  end
end
