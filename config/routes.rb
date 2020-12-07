Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get '/frequently_qa', to: 'static_page#frequently_qa'
  get '/management', to: 'static_page#management'
  get '/privacy', to: 'static_page#privacy'
  get '/term', to: 'static_page#term'
  root to: 'static_page#home'

  resources :movies
  get 'search', to:'movies#index'
  
  resources :genres
  resources :directors
  resources :screenwriters
  resources :casts
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]
  resources :reviews

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
end
