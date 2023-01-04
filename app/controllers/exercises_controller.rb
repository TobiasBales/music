# typed: true
# frozen_string_literal: true

class ExercisesController < ApplicationController
  extend T::Sig

  def index
    authorize Exercise.new, :index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.includes(:course).find(params[:id])
    authorize @exercise
    @bpm = @exercise.bpm || 120
    @previous, @next = @exercise.course.previous_and_next(@exercise)

    return if Current.user.nil?

    last_log = Current.user.exercise_logs.where(exercise: @exercise).order(:created_at).last
    @bpm = last_log.bpm if last_log.present?
  end
end
