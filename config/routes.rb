# typed: strict
# frozen_string_literal: true

Rails.application.routes.draw do
  root "exercises#index"

  resources :exercises
end
