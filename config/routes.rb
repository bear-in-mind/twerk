Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'profiles/show'
  get 'profiles/edit'
  get "profiles/:id", to: "profiles#show", as: :show_profile
  get 'profiles/:id/edit', to: 'profiles#edit', as: :edit_profile

  resources :talents, only: [:new, :create, :edit, :update, :destroy]
  resources :reviews, only: [ :new, :create]
  resources :experiences, only: [ :new, :create, :update, :edit, :destroy]
  resources :jobs, only: [:new, :create, :index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
