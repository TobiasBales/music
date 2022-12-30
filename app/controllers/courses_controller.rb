# typed: true
# frozen_string_literal: true

class CoursesController < ApplicationController
  extend T::Sig

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @enrollment = Current.user&.enrollment(@course)
  end
end
