# typed: true
# frozen_string_literal: true

class CoursesController < ApplicationController
  extend T::Sig

  def index
    authorize Course.new, :index?
    @courses = Course.all.order(:name)
  end

  def show
    @course = Course.find(params[:id])
    authorize @course, :show?
    @enrollment = Current.user&.enrollment(@course)
  end
end
