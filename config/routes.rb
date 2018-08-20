Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :talents, shallow: true, only: [:new, :create, :edit, :update, :destroy]
  resources :reviews, only: [ :new, :create]
  resources :experiences, only: [ :new, :create, :update, :edit, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
