Rails.application.routes.draw do
root 'static_pages#home'
get 'password_resets/new'
get 'password_resets/edit'
get 'sessions/new'
get '/signup' => 'users#new'
get 'static_pages#help'
get 'static_pages#about'
get 'static_pages#contact'
resources :users do
  member do
    get :following,:followers
  end
end
get '/login' => 'sessions#new'
post 'login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'
resources :account_activations, only:[:edit]
resources :password_resets, only: [:new,:create,:edit,:update]
resources :microposts, only: [:create,:destroy]
resources :relationships, only: [:create, :destroy]

end
