# typed: strict
# frozen_string_literal: true

require "test_helper"

class CourseTest < ActiveSupport::TestCase
  test "#can_access? works when a course has no permissions" do
    course = Course.new
    user = users(:default)

    assert course.can_access?(user)
    assert course.can_access?(nil)
  end

  test "#can_access? works when the user is staff" do
    course = Course.new
    course.permissions.build
    user = User.new(staff: true)

    assert course.can_access?(user)
  end

  test "#can_access? works when the course has permissions" do
    course = Course.new
    user_with_access = User.new
    user_without_access = User.new
    course.permissions.build(users: [user_with_access])

    assert course.can_access?(user_with_access)
    assert_not course.can_access?(user_without_access)
    assert_not course.can_access?(nil)
  end
end
