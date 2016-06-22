require 'test_helper'

class InfohashUsersControllerTest < ActionController::TestCase
  setup do
    @infohash_user = infohash_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:infohash_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create infohash_user" do
    assert_difference('InfohashUser.count') do
      post :create, infohash_user: { infohash_id: @infohash_user.infohash_id, user_id: @infohash_user.user_id }
    end

    assert_redirected_to infohash_user_path(assigns(:infohash_user))
  end

  test "should show infohash_user" do
    get :show, id: @infohash_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @infohash_user
    assert_response :success
  end

  test "should update infohash_user" do
    patch :update, id: @infohash_user, infohash_user: { infohash_id: @infohash_user.infohash_id, user_id: @infohash_user.user_id }
    assert_redirected_to infohash_user_path(assigns(:infohash_user))
  end

  test "should destroy infohash_user" do
    assert_difference('InfohashUser.count', -1) do
      delete :destroy, id: @infohash_user
    end

    assert_redirected_to infohash_users_path
  end
end
