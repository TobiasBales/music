# typed: true
# frozen_string_literal: true

class ExercisesController < ApplicationController
  extend T::Sig

  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find(params[:id])
  end
end
