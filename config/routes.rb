# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  namespace :admin do
    get '', to: 'home#index'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    resources :sessions, only: %i[create destroy]
    post 'login', to: 'sessions#create'
    resources :users
  end
end
