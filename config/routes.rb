Rails.application.routes.draw do
  devise_for :users

  get "welcome/index"

  get "welcome/about"

  root "welcome#index"
<<<<<<< HEAD
=======

>>>>>>> e14a5d52aa2e11e045a5560c313564d3cef03d65
end
