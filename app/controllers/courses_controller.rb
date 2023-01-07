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
    @actions = show_actions
  end

  private

  sig { returns(T::Array[Bootstrap::Action]) }
  def show_actions
    actions = []

    actions << Bootstrap::Action.new(text: "View in madmin", to: madmin_course_path(@course)) if Current.user.admin
    actions << Bootstrap::Action.new(text: "Edit in madmin", to: edit_madmin_course_path(@course)) if Current.user.admin

    actions
  end
end
