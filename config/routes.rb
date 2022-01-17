Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to:"sessions#destroy"
  
  get "signup", to: "users#new"
  resources :users, only: [:index,:show,:create] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  
  resources :posts, only: [:index,:new,:show,:create,:destroy] do
    resources :comments,only: [:create,:destroy]
  end
  
  resources :relationships, only: [:create,:destroy]
  resources :favorites,only: [:create,:destroy]
  
end
