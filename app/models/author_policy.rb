# typed: strict
# frozen_string_literal: true

class AuthorPolicy < ApplicationPolicy
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
    user&.admin || false
  end

  sig { override.returns(T::Boolean) }
  def update?
    user&.admin || false
  end

  sig { override.returns(T::Boolean) }
  def destroy?
    user&.admin || false
  end
end
