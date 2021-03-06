Rails.application.routes.draw do
  root 'welcome#welcome'
  resources :reservations, only: [:edit, :update, :create, :destroy]
  get "items/available", to: "items#index", as: "items_available"


  resources :reviews, only: [:index, :new, :create]
  resources :locations
  resources :items, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :new, :show, :create, :edit, :update]

  resources :items, only: :show do
    get '/reservations', to: "reservations#items_reservations"
  end

  resources :users, only: :show do
    get '/reviews', to: "reviews#index"
  end

  get "seller", to: "users#seller", as: "seller"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  post "sessions", to: "sessions#create", as: "sessions"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
