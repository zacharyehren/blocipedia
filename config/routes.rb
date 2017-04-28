Rails.application.routes.draw do
  get 'charges/new'

  get 'charges/create'

  get 'charges_controller/new'

  get 'charges_controller/create'

  devise_for :users

  get "about" => "welcome#about"

  root "welcome#index"

  resources :wikis
end
