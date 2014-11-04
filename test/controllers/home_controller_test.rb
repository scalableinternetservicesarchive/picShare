require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get inbox" do
    get :inbox
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
