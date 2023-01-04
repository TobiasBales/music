# typed: true
# frozen_string_literal: true

class ExerciseLogsController < ApplicationController
  extend T::Sig

  before_action :authenticate, except: :show
  before_action :set_exercise_and_exercise_log

  def show
    authorize @exercise_log
    @exercise_logs = load_exercise_logs
  end

  def update
    authorize @exercise_log
    @exercise_log.bpm = bpm_param.to_i
    @exercise_log.time = DateTime.now.utc
    @exercise_logs = load_exercise_logs
    if @exercise_log.save
      render :show
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_exercise_and_exercise_log
    @exercise = Exercise.find(params[:id])
    @exercise_log = build_exercise_log(Current.user, @exercise)
  end

  sig { params(user: T.nilable(User), exercise: Exercise).returns(T.nilable(ExerciseLog)) }
  def build_exercise_log(user, exercise)
    return if user.nil?

    user.exercise_logs.build(exercise: exercise)
  end

  sig { returns(T.nilable(ActiveRecord::Relation)) }
  def load_exercise_logs
    return if Current.user.nil?

    Current.user.exercise_logs.where(exercise: @exercise).order(created_at: :desc).limit(30)
  end

  def bpm_param
    T.cast(params[:bpm], String)
  end
end
