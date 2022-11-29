require "test_helper"

class TombstonesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get tombstones_show_url
    assert_response :success
  end

  test "should get new" do
    get tombstones_new_url
    assert_response :success
  end

  test "should get create" do
    get tombstones_create_url
    assert_response :success
  end

  test "should get edit" do
    get tombstones_edit_url
    assert_response :success
  end

  test "should get update" do
    get tombstones_update_url
    assert_response :success
  end
end
