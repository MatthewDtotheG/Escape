Rails.application.routes.draw do
  root 'items#index'
  resources :reservations
  resources :reviews
  resources :locations
  resources :items
  resources :users
  # resources :users do
  #   resources :items
  # end

  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  post "sessions", to: "sessions#create", as: "sessions"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
