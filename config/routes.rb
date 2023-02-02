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

  resources :ai_images, only: [:index, :new, :create]
  resources :ai_stories, only: [:index, :new, :create]

  root "pages#home"
end
