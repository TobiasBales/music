# typed: strict
# frozen_string_literal: true

class ExerciseLogPolicy < ApplicationPolicy
  extend T::Sig

  sig { override.returns(T::Boolean) }
  def index?
    true
  end

  sig { override.returns(T::Boolean) }
  def show?
    exercise_log.user == user
  end

  sig { override.returns(T::Boolean) }
  def create?
    user.present?
  end

  sig { override.returns(T::Boolean) }
  def update?
    exercise_log.user == user
  end

  sig { override.returns(T::Boolean) }
  def destroy?
    exercise_log.user == user
  end

  private

  sig { returns(ExerciseLog) }
  def exercise_log
    T.cast(record, ExerciseLog)
  end
end
