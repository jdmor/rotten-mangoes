Rails.application.routes.draw do

  root to: 'home#index'

  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    resources :users
  end
end
