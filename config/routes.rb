Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get '/signup' => 'users#new'

root 'static_pages#home'
get  '/help' => 'static_pages#help'
get  '/about' => 'static_pages#about'
get  '/contact' => 'static_pages#contact'
resources :users
get '/login' => 'sessions#new'
post 'login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'
resources :account_activations, only:[:edit]
resources :password_resets, only: [:new,:create,:edit,:update]

end