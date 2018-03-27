Rails.application.routes.draw do
  root 'welcome#welcome'
  resources :reservations
  resources :reviews
  resources :locations
  # resources :items, except: :index
  resources :users
  # resources :users do
  #   resources :items
  # end

  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  post "sessions", to: "sessions#create", as: "sessions"
  get "items/available", to: "items#index", as: "items_available"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
