# typed: strict
# frozen_string_literal: true

class CoursePermissionPolicy < ApplicationPolicy
  extend T::Sig

  sig { override.returns(T::Boolean) }
  def index?
    true
  end

  sig { override.returns(T::Boolean) }
  def show?
    true
  end

  sig { override.returns(T::Boolean) }
  def create?
    user.present?
  end

  sig { override.returns(T::Boolean) }
  def update?
    course_permission.users.include?(user) || user&.admin? || false
  end

  sig { override.returns(T::Boolean) }
  def destroy?
    course_permission.users.include?(user) || user&.admin? || false
  end

  private

  sig { returns(CoursePermission) }
  def course_permission
    T.cast(record, CoursePermission)
  end
end
