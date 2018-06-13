# frozen_string_literal: true

Rails.application.routes.draw do
  get 'messages/index'

  root 'static_pages#home'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get '/signup' => 'users#new'
  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  resources :users do
    member do
      get :following, :followers
      get :likes
      get '/dm' => 'messages#index'
    end
  end
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :account_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]
  resources :microposts, only: %i[create destroy] do
    post '/like' => 'likes#create'
    delete '/like' => 'likes#destroy'
    get '/reply' => 'microposts#reply'
    post '/' => 'microposts#make_reply'
  end
  resources :relationships, only: %i[create destroy]
  get '/search' => 'microposts#search'
  resources :messages, only: [:create]
end
