# typed: false
# frozen_string_literal: true

require "application_system_test_case"

class ProfilesTest < ApplicationSystemTestCase
  setup do
    @profile = profiles(:one)
    sign_in_as(@profile.user)
  end

  test "visiting show" do
    visit profile_url

    assert_selector "a", text: "Edit your profile"
  end

  test "should update Profile" do
    visit profile_url
    click_on "Edit your profile", match: :first

    check "Count in" if @profile.count_in
    click_on "Save"

    assert_text "Profile was successfully updated"
  end
end
