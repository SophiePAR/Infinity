require "test_helper"

class PrestationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get prestations_create_url
    assert_response :success
  end
end
