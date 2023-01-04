# typed: false
# frozen_string_literal: true

require "application_system_test_case"

class TabsTest < ApplicationSystemTestCase
  setup do
    @tab = tabs(:one)
    sign_in_as(users(:admin))
  end

  test "visiting the index" do
    visit tabs_url

    assert_selector "li", text: "Tabs"
  end

  test "should create tab" do
    visit tabs_url
    click_on "New tab"

    fill_in "Album", with: @tab.album
    fill_in "Artist", with: @tab.artist
    fill_in "Song", with: @tab.song
    attach_file "tab[tab]", file_fixture("tab.gp")
    click_on "Save"

    assert_text "Tab was successfully created"
    click_on "Back"
  end

  test "should update Tab" do
    visit tab_url(@tab)
    click_on "Edit this tab", match: :first

    fill_in "Album", with: @tab.album
    fill_in "Artist", with: @tab.artist
    fill_in "Song", with: @tab.song
    click_on "Save"

    assert_text "Tab was successfully updated"
    click_on "Back"
  end

  test "should destroy Tab" do
    visit tab_url(@tab)
    accept_confirm do
      click_on "Destroy this tab", match: :first
    end

    assert_text "Tab was successfully destroyed"
  end
end
