# typed: true
# frozen_string_literal: true

class EnrollmentsController < ApplicationController
  before_action :authenticate
  before_action :set_course_and_enrollment

  def show; end

  def update
    if @enrollment.save
      render :show
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    if @enrollment.destroy
      @enrollment = Current.user.enrollments.build(course: @course)
      render :show
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_course_and_enrollment
    @course = Course.find(params[:id])
    @enrollment = Current.user.enrollment(@course) || Current.user.enrollments.build(course: @course)
  end
end
