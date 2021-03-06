Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :profiles, only: [:index, :show, :edit] do
    resources :jobs, only: [:new, :create]
    resources :reviews, only: [ :new, :create]
  end
  patch "profiles/:id", to: "profiles#update", as: "profiles_update"
  resources :jobs, only: [:show, :index, :update]

  resources :talents, only: [:new, :create, :edit, :update, :destroy]
  resources :experiences, only: [ :new, :create, :update, :edit, :destroy]
  resources :messages, only: [ :new, :create ]
end
