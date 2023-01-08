# typed: strict
# frozen_string_literal: true

class Current < ActiveSupport::CurrentAttributes
  extend T::Sig

  attribute :session, :user
  attribute :user_agent, :ip_address

  def session=(session)
    super
    self.user = session.user
  end

  sig { returns(Profile) }
  def profile
    return Profile.new(count_in: true, muted: false) if user.blank?

    user.profile || Profile.new(user: user, count_in: true)
  end
end
