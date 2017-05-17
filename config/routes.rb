Rails.application.routes.draw do

  devise_for :users

  get "about" => "welcome#about"

  root "welcome#index"

  resources :wikis
  resources :collaborators, only: [:create, :destroy]

  resources :charges, only: [:new, :create, :edit, :destroy]
  resources :users, only: [:edit, :update]

end
