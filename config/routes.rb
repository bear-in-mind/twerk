Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :reviews, only: [ :new, :create]
    resources :experiences, only: [ :new, :create, :update, :edit, :destroy]
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
