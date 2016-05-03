require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get new_user_url
    assert_response :success
  end

=begin
  test "should get create" do
    @users = User.new(:username => 'testy123', :email => 'testy123@foobar.com', :password => 'abcdabcd', :password_confirmation => 'abcdabcd')
    get users_create_url
    #post users_create_url,  :username => "testy123", :email => "testy123@foobar.com", :password => "abcdabcd", :password_confirmation =>"abcdabcd"

    assert_response :success
  end
=end

  test "should get update" do

    get users_update_url
    login_as_admin
    assert_response :success
  end

  test "should get edit" do

    get users_edit_url
    login_as_admin
    assert_response :success
  end

  test "should get destroy" do

    get users_destroy_url
    login_as_admin
    assert_response :success
  end

  test "should get index" do

    get users_index_url
    login_as_admin
    assert_response :success
  end

  test "should get show" do

    get users_show_url
    login_as_admin
    assert_response :success
  end

end
