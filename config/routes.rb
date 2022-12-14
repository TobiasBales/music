# typed: strict
# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tabs
  draw :madmin

  get  "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  get  "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  resources :sessions, only: [:index, :show, :destroy]
  resource  :password, only: [:edit, :update]
  namespace :identity do
    resource :email,              only: [:edit, :update]
    resource :email_verification, only: [:edit, :create]
    resource :password_reset,     only: [:new, :edit, :create, :update]
  end
  root "home#index"

  resources :courses
  resources :exercises
  resources :enrollments
  resources :exercise_logs
  resource :profile
end
