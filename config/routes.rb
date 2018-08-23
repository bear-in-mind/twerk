Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :profiles, only: [:index, :show, :edit, :update] do
    resources :jobs, only: [:new, :create]
  end
  resources :jobs, only: [:show, :index]
  resources :talents, only: [:new, :create, :edit, :update, :destroy]
  resources :reviews, only: [ :new, :create]
  resources :experiences, only: [ :new, :create, :update, :edit, :destroy]
  resources :messages, only: [ :new, :create ]
end
