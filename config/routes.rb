Rails.application.routes.draw do
  root to: 'static_page#home'
  resources :movies
  resources :genres
  resources :directors
  resources :screenwriters
  resources :casts
  resources :users

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  #deleteと設定するとセッションの削除ができない
  get '/logout', to: 'sessions#destroy'
end
