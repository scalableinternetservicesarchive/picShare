require 'test_helper'

class PostVotesControllerTest < ActionController::TestCase
  setup do
    @post_vote = post_votes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_vote" do
    assert_difference('PostVote.count') do
      post :create, post_vote: {  }
    end

    assert_redirected_to post_vote_path(assigns(:post_vote))
  end

  test "should show post_vote" do
    get :show, id: @post_vote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_vote
    assert_response :success
  end

  test "should update post_vote" do
    patch :update, id: @post_vote, post_vote: {  }
    assert_redirected_to post_vote_path(assigns(:post_vote))
  end

  test "should destroy post_vote" do
    assert_difference('PostVote.count', -1) do
      delete :destroy, id: @post_vote
    end

    assert_redirected_to post_votes_path
  end
end
