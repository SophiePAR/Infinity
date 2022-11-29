require "test_helper"

class Provider::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get provider_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get provider_orders_show_url
    assert_response :success
  end

  test "should get update" do
    get provider_orders_update_url
    assert_response :success
  end
end
