# frozen_string_literal: true

Rails.application.routes.draw do
  resources :investments
  resources :users, only: :show
  devise_for :users
  root 'landing#index'
end
