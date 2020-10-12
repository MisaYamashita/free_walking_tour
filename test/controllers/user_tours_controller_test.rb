require 'test_helper'

class UserToursControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_tours_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_tours_destroy_url
    assert_response :success
  end

end
