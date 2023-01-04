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
    @bpm = 120
  end
end
