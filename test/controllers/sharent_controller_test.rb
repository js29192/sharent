require 'test_helper'

class SharentControllerTest < ActionController::TestCase
  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

end
