Rails.application.routes.draw do
  root to: 'movies#index'
  resources :movies
  resources :genres
  resources :directors
  resources :screenwriters
end
