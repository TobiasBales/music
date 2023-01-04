# typed: true
# frozen_string_literal: true

require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
    sign_in_as(@profile.user)
  end

  test "should show profile" do
    get profile_url

    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url

    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { count_in: @profile.count_in } }

    assert_redirected_to profile_url
  end
end
