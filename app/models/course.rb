# typed: strict
# frozen_string_literal: true

class Course < ApplicationRecord
  extend T::Sig

  belongs_to :instrument
  belongs_to :author
  has_many :exercises, dependent: :destroy
  has_many :enrollments, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true

  has_many :permissions, class_name: "CoursePermission", dependent: :destroy

  sig { params(user: User).returns(T::Boolean) }
  def can_access?(user)
    return true if permissions.empty?

    return true if user.staff

    return true if permissions.find { |p| p.users.include?(user) }.present?

    false
  end
end
