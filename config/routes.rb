Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :agents, only: [:new, :create]
  resources :notifications
  resources :inquiries
  resources :ads
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#login'
  # get 'welcome', to: 'sessions#welcome'
end
