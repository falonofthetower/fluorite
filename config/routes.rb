Rails.application.routes.draw do
  root to: 'users#new'

  get 'register', to: 'users#new'
  resources :users, only: [:create, :edit, :show, :update]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
