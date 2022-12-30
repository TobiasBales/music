# typed: strict
# frozen_string_literal: true

class User < ApplicationRecord
  extend T::Sig

  has_secure_password

  has_many :email_verification_tokens, dependent: :destroy
  has_many :password_reset_tokens, dependent: :destroy

  has_many :sessions, dependent: :destroy

  has_one :profile, dependent: :destroy
  has_many :enrollments, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, allow_nil: true, length: { minimum: 12 }, format: { with: /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])/ }

  sig { params(course: Course).returns(T.nilable(Enrollment)) }
  def enrollment(course)
    enrollments.find { |e| e.course == course }
  end

  sig { params(course: Course).returns(T::Boolean) }
  def enrolled?(course)
    enrollment(course).present?
  end

  before_validation do
    T.bind(self, User)
    self.email = email.downcase.strip
  end

  before_validation if: lambda {
                          T.bind(self, User)
                          email_changed? && persisted?
                        } do
    T.bind(self, User)
    self.verified = false
  end

  after_update if: :password_digest_previously_changed? do
    T.bind(self, User)
    sessions.where.not(id: Current.session).destroy_all
  end
end
