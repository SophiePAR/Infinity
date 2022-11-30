Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :tombstones, only: [:show, :new, :create, :edit, :update] do
    resources :orders, only: :create
    resources :messages, only: [:create]
  end

  resources :orders, only: [:show, :update]

  namespace :provider do
    resources :orders, only: [:index, :show, :update]
  end

  resources :orders, only: [:destroy] do
    resources :order_items, only: [:create]
    resources :prestations, only: [:create]
  end

  resources :users, only: [:show]
  get 'pages/about', to: 'pages#about'
end
