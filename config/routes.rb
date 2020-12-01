Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root to: 'static_page#home'
  resources :movies
  resources :genres
  resources :directors
  resources :screenwriters
  resources :casts
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
end
