# frozen_string_literal: true

Rails.application.routes.draw do
  resources :investments do
    collection do
      get :bulk_load
      post :create_bulk_investments
    end
  end
  devise_for :users
  resources :users, only: :show
  root 'landing#index'
  get '*path', to: 'landing#index'
end
