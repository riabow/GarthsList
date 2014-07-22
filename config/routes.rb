require "monban/constraints/signed_in"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resource :admin, only: [:show]
  resources :posts, only: [:new, :create, :index]
  resources :regions, only: [:new, :create]

  constraints Monban::Constraints::SignedIn.new do
    root "posts#index", as: :index
  end

  root to: "sessions#new"
end
