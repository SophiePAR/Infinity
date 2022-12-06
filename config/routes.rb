Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :tombstones, only: [:show, :new, :create, :edit, :update] do
    resources :orders, only: :create
    resources :messages, only: [:create]
  end

  resources :orders, only: [:show, :update] do
    get 'finish', to: 'orders#finish'
  end

  namespace :provider do
    resources :orders, only: [:index, :show, :update]
  end

  resources :orders, only: [:destroy] do
    resources :order_items, only: [:create]
    resources :prestations, only: [:create]
  end

  resources :order_items, only: [:destroy]

  resources :users, only: [:show]
  get 'pages/about', to: 'pages#about'
  get 'my_missions', to: 'users#my_missions'
  resources :users, except: [:new, :create]
end
