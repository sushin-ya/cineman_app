Rails.application.routes.draw do
  root to: 'static_page#home'
  resources :movies
  resources :genres
  resources :directors
  resources :screenwriters
  resources :casts
  resources :users
  
  get '/signup', to: 'users#new'
end
