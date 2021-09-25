Rails.application.routes.draw do

  devise_for :admins, controllers: {
    registrations: 'registrations'
  }

  get "users", to: "users#index"

  # get "admins", to: "admins#show"
  resources :messages
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
