require 'test_helper'

class InquirysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get inquirys_new_url
    assert_response :success
  end

  test "should get create" do
    get inquirys_create_url
    assert_response :success
  end

end
