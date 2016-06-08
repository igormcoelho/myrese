require 'test_helper'

class InfohashesControllerTest < ActionController::TestCase
  setup do
    @infohash = infohashes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:infohashes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create infohash" do
    assert_difference('Infohash.count') do
      post :create, infohash: { code: @infohash.code, group_id: @infohash.group_id, user_id: @infohash.user_id, visibility_id: @infohash.visibility_id }
    end

    assert_redirected_to infohash_path(assigns(:infohash))
  end

  test "should show infohash" do
    get :show, id: @infohash
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @infohash
    assert_response :success
  end

  test "should update infohash" do
    patch :update, id: @infohash, infohash: { code: @infohash.code, group_id: @infohash.group_id, user_id: @infohash.user_id, visibility_id: @infohash.visibility_id }
    assert_redirected_to infohash_path(assigns(:infohash))
  end

  test "should destroy infohash" do
    assert_difference('Infohash.count', -1) do
      delete :destroy, id: @infohash
    end

    assert_redirected_to infohashes_path
  end
end
