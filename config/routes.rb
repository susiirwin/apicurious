Rails.application.routes.draw do
  root 'home#index'
  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :users, only: [:show]
  resources :repos, only: [:index]
  resources :commits, only: [:index]
end
