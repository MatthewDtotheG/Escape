Rails.application.routes.draw do
  root 'welcome#welcome'
  get "items/available", to: "items#index", as: "items_available"
  resources :reservations
  resources :reviews
  resources :locations
  resources :items, only: :show
  resources :users, only: [:index, :new, :show, :create, :edit]

  # resources :users do
  #   resources :items
  # end

  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  post "sessions", to: "sessions#create", as: "sessions"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
