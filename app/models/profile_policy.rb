# typed: strict
# frozen_string_literal: true

class ProfilePolicy < ApplicationPolicy
  extend T::Sig

  sig { override.returns(T::Boolean) }
  def index?
    true
  end

  sig { override.returns(T::Boolean) }
  def show?
    profile.user == user
  end

  sig { override.returns(T::Boolean) }
  def create?
    user.present?
  end

  sig { override.returns(T::Boolean) }
  def update?
    profile.user == user
  end

  sig { override.returns(T::Boolean) }
  def destroy?
    profile.user == user
  end

  private

  sig { returns(Profile) }
  def profile
    T.cast(record, Profile)
  end
end
