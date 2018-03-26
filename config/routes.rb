Rails.application.routes.draw do
  root 'items#index'
  resources :reservations
  resources :reviews
  resources :locations
  resources :items
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
