# typed: strict
# frozen_string_literal: true

class EnrollmentPolicy < ApplicationPolicy
  extend T::Sig

  sig { override.returns(T::Boolean) }
  def index?
    true
  end

  sig { override.returns(T::Boolean) }
  def show?
    enrollment.user == user
  end

  sig { override.returns(T::Boolean) }
  def create?
    user.present?
  end

  sig { override.returns(T::Boolean) }
  def update?
    enrollment.user == user
  end

  sig { override.returns(T::Boolean) }
  def destroy?
    enrollment.user == user
  end

  private

  sig { returns(Enrollment) }
  def enrollment
    T.cast(record, Enrollment)
  end
end
