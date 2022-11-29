require "test_helper"

class OrderItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get order_items_create_url
    assert_response :success
  end
end
