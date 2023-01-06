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

    @actions = show_actions

    return if Current.user.nil?

    last_log = Current.user.exercise_logs.where(exercise: @exercise).order(:created_at).last
    @bpm = last_log.bpm if last_log.present?
  end

  private

  sig { returns(T::Array[Bootstrap::Action]) }
  def show_actions
    actions = []

    next_exercise = @exercise.course.next(@exercise)
    actions << Bootstrap::Action.new(text: "Next", to: next_exercise) if next_exercise.present?

    actions
  end
end
