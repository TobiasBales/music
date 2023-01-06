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

  sig { params(user: T.nilable(User)).returns(T::Boolean) }
  def can_access?(user)
    return true if permissions.empty?

    return false if user.nil?

    return true if user.staff

    return true if permissions.find { |p| p.users.include?(user) }.present?

    false
  end

  sig { params(exercise: Exercise).returns(T.nilable(Exercise)) }
  def previous(exercise)
    return nil if exercises.size <= 1

    exercises.to_a.each_cons(2) do |a, b|
      return a if b == exercise
    end

    nil
  end

  sig { params(exercise: Exercise).returns(T.nilable(Exercise)) }
  def next(exercise)
    return nil if exercises.size <= 1

    exercises.to_a.each_cons(2) do |a, b|
      return b if a == exercise
    end

    nil
  end

  sig { returns(T.any(String, ActiveStorage::VariantWithRecord)) }
  def thumbnail
    image.representation({ resize_to_limit: [350, 350] }) || "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"
  end
end
