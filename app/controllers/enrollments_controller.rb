# typed: true
# frozen_string_literal: true

class EnrollmentsController < ApplicationController
  extend T::Sig

  before_action :authenticate, except: :show
  before_action :set_course_and_enrollment

  def show
    authorize @enrollment
  end

  def update
    authorize @enrollment
    if @enrollment.save
      render :show
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @enrollment
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
    @enrollment = build_enrollment(Current.user, @course)
  end

  sig { params(user: T.nilable(User), course: Course).returns(Enrollment) }
  def build_enrollment(user, course)
    return Enrollment.new(course: course) if user.nil?

    existing_enrollment = user.enrollment(course)
    return existing_enrollment if existing_enrollment.present?

    user.enrollments.build(course: course)
  end
end
