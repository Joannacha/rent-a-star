Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :stars do
      resources :bookings, only: [ :create ]
    end
    resources :bookings, only: [ :show, :destroy ] do
      resources :reviews, only: [ :create ]
      collection do
        get :my_bookings
        get :my_listings
      end
    end
  end
