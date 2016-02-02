RottenMangoes::Application.routes.draw do

  resources :movies

  resources :users

  resources :sessions, only: [:new, :create]

end
