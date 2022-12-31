# typed: false
# frozen_string_literal: true

# Below are the routes for madmin
namespace :madmin do
  resources :course_permissions
  namespace :active_storage do
    resources :variant_records
  end
  namespace :active_storage do
    resources :attachments
  end
  namespace :active_storage do
    resources :blobs
  end
  resources :users
  resources :exercises
  resources :instruments
  resources :password_reset_tokens
  resources :profiles
  resources :sessions
  resources :authors
  resources :courses
  resources :email_verification_tokens
  resources :enrollments
  root to: "dashboard#show"
end
