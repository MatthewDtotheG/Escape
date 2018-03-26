Rails.application.routes.draw do
  resources :reservations
  resources :reviews
  resources :locations
  resources :items
  resources :users
  resources :users do
    resources :items
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
