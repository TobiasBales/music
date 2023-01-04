# typed: strict
# frozen_string_literal: true

class SessionPolicy < ApplicationPolicy
  extend T::Sig

  sig { override.returns(T::Boolean) }
  def index?
    true
  end

  sig { override.returns(T::Boolean) }
  def show?
    session.user == user
  end

  sig { override.returns(T::Boolean) }
  def create?
    user.present?
  end

  sig { override.returns(T::Boolean) }
  def update?
    session.user == user
  end

  sig { override.returns(T::Boolean) }
  def destroy?
    session.user == user
  end

  private

  sig { returns(Session) }
  def session
    T.cast(record, Session)
  end
end
