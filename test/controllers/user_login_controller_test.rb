require 'test_helper'

class UserLoginControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_login_new_url
    assert_response :success
  end

end
