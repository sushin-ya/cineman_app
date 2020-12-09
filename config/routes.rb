Rails.application.routes.draw do
  namespace :admin do
    get '/home', to: 'users#home'
    resources :movies
    resources :directors
    resources :genres
    resources :screenwriters
    resources :casts
  end

  get 'password_resets/new'
  get 'password_resets/edit'
  get '/frequently_qa', to: 'static_page#frequently_qa'
  get '/management', to: 'static_page#management'
  get '/privacy', to: 'static_page#privacy'
  get '/term', to: 'static_page#term'
  get '/search_by_director', to: 'static_page#search_by_director'
  get '/search_by_count', to: 'static_page#search_by_count'

  root to: 'users#top'

  resources :movies, only: %i[index show]

  get 'search', to: 'movies#search'

  resources :screenwriters, only: [:index] do
    get :movies
  end

  resources :genres, only: [:index] do
    get :movies
  end
  resources :directors, only: [:index] do
    get :movies
  end

  resources :production_years, only: [:index] do
    get :movies
  end

  resources :users do
    get :reviews
  end

  resources :account_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]
  resources :reviews

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
