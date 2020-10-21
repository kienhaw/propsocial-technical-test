Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :agents, only: [:new, :create]
  resources :notifications
  resources :inquiries
  resources :ads
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#login'
  get 'logout', to: 'sessions#logout'
  # get 'welcome', to: 'sessions#welcome'
end
