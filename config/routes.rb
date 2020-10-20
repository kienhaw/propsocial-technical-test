Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :agents, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#login'
  # get 'welcome', to: 'sessions#welcome'
  get 'ads-listing', to: 'ads#index'
  get 'ads-create', to: 'ads#create'
end
