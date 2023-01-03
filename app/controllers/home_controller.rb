# typed: true
# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @enrollments = Current.user&.enrollments&.includes(:course)&.order("courses.name") || []
  end
end
