Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    get 'user_addresses', to: 'users/registrations#new_user_address'
    post 'user_addresses', to: 'users/registrations#create_user_address'
  end

  root to: "home#index"
  resources :users, only: [:show, :update]
  resources :user_addresses, only: [:update]

  resources :credit_cards, only: [:show, :destroy] do
    collection do
      post 'pay', to: 'credit_cards#pay'
    end
  end

  resources :products do
    collection do
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
      get 'search'
      get 'post_done'
      get 'delete_done'
      get 'detail_search'
      get 'update_done'
    end

    resources :buyers, only: [:index] do
      collection do
        get 'done', to: 'buyers#done'
        post 'pay', to: 'buyers#pay'
      end
    end
  end
end
