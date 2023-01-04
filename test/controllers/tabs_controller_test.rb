# typed: true
# frozen_string_literal: true

require "test_helper"

class TabsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tab = tabs(:one)
    sign_in_as(users(:admin))
  end

  test "should get index" do
    get tabs_url

    assert_response :success
  end

  test "should get new" do
    get new_tab_url

    assert_response :success
  end

  test "should create tab" do
    assert_difference("Tab.count") do
      post tabs_url, params: { tab: { album: @tab.album, artist: @tab.artist, song: @tab.song } }
    end

    assert_redirected_to tab_url(Tab.order(:created_at).last)
  end

  test "should show tab" do
    get tab_url(@tab)

    assert_response :success
  end

  test "should get edit" do
    get edit_tab_url(@tab)

    assert_response :success
  end

  test "should update tab" do
    patch tab_url(@tab), params: { tab: { album: @tab.album, artist: @tab.artist, song: @tab.song } }

    assert_redirected_to tab_url(@tab)
  end

  test "should destroy tab" do
    assert_difference("Tab.count", -1) do
      delete tab_url(@tab)
    end

    assert_redirected_to tabs_url
  end
end
