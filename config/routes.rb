Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }
  get 'about', to: 'pages#about'
  root "pages#home"
end
