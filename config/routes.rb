Rails.application.routes.draw do
  devise_for :users
  get 'about', to: 'about#index'
  root "home#index"
end
