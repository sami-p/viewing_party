Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :users, only: [:new, :create]
  resources :dashboard, only: [:index]
  resources :friendships, only: [:create]
  resources :discover, only: [:index]
  resources :movies, only: [:index, :show]

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'

  get '/logout', to: 'users#logout'
end
