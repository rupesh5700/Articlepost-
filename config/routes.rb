# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'
  # get 'home/index'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  root 'home#index'
  # root 'welcome#index'
  resources :articles do
    resources :comments
    resources :likes
  end
  resources :users
  resources :sessions, only: %i[new create destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
