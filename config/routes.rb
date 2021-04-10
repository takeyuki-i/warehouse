Rails.application.routes.draw do
  root to: 'items#index'
  resources :items, only: [:index , :new , :create ,:edit ,:destroy , :show , :update]
  resources :items do
    resources :states , only: [:index , :new , :create , :update , :edit , :destroy ]
  end
  resources :states do
    collection do
      get 'search'
    end
    member do
      get 'search_firstinout'
      get 'search_lastinout'
      get 'search_exdate'
    end
  end

  devise_for :users
end