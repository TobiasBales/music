# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "aws-sdk-s3", require: false
gem "bcrypt"
gem "bootsnap", require: false
gem "cssbundling-rails"
gem "image_processing"
gem "jbuilder"
gem "jsbundling-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "que"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "redis", "~> 4.0"
gem "sorbet-runtime"
gem "sprockets-rails"
gem "stimulus-rails"
gem "strong_migrations"
gem "turbo-rails"
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem "debug", platforms: [:mri, :mingw, :x64_mingw]
  gem "sorbet"
  gem "spoom"
  gem "tapioca"
end

group :development do
  gem "guard", require: false
  gem "guard-minitest", require: false
  gem "rack-mini-profiler"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-sorbet", require: false
  gem "ruby-lsp"
  # gem "spring"
  gem "terminal-notifier-guard", require: false
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "view_component", "~> 2.80"

gem "authentication-zero", "~> 2.16"

gem "madmin", "~> 1.2"

gem "pundit", "~> 2.3"
