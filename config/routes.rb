Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }
  get 'about', to: 'pages#about'
  get 'features', to: 'pages#features', as: :user_root

  get 'ai_images', to: 'ai_images#index'
  get 'ai_stories', to: 'ai_stories#index'

  root "pages#home"
end
