require 'test_helper'

class InboxesControllerTest < ActionController::TestCase
  setup do
    @inbox = inboxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inboxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inbox" do
    assert_difference('Inbox.count') do
      post :create, inbox: {  }
    end

    assert_redirected_to inbox_path(assigns(:inbox))
  end

  test "should show inbox" do
    get :show, id: @inbox
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inbox
    assert_response :success
  end

  test "should update inbox" do
    patch :update, id: @inbox, inbox: {  }
    assert_redirected_to inbox_path(assigns(:inbox))
  end

  test "should destroy inbox" do
    assert_difference('Inbox.count', -1) do
      delete :destroy, id: @inbox
    end

    assert_redirected_to inboxes_path
  end
end
