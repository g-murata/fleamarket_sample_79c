Rails.application.routes.draw do
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
  resources :products, only: [:new, :create, :index, :show, :destroy]
  resources :items, only: [:index]
end
