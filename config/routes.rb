Rails.application.routes.draw do
  get 'buyers/index'
  get 'buyers/done'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'user_addresses', to: 'users/registrations#new_user_address'
    post 'user_addresses', to: 'users/registrations#create_user_address'
  end

  root to: "home#index"
  resources :users, only: [:show, :update]
  resources :user_addresses, only: [:update]
  # resources :credit_cards, only: [:new, :show, :destroy] do
  resources :credit_cards, only: [:show, :destroy] do
    collection do
      post 'pay', to: 'credit_cards#pay'
    end
  end
end
