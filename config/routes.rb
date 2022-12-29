# typed: strict
# frozen_string_literal: true

Rails.application.routes.draw do
  root "courses#index"

  resources :courses
  resources :exercises
end
