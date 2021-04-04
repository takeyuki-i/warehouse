Rails.application.routes.draw do
  root to: 'items#index'
  resources :items, only: [:index , :new , :create ,:edit ,:destroy , :show , :update]
  resources :items do
    resources :states , only: [:index , :new , :create , :update , :edit , :destroy ]
  end
  devise_for :users
end