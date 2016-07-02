require 'test_helper'

class FolderInfohashesControllerTest < ActionController::TestCase
  setup do
    @folder_infohash = folder_infohashes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:folder_infohashes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create folder_infohash" do
    assert_difference('FolderInfohash.count') do
      post :create, folder_infohash: { folder_id: @folder_infohash.folder_id, infohash_id: @folder_infohash.infohash_id }
    end

    assert_redirected_to folder_infohash_path(assigns(:folder_infohash))
  end

  test "should show folder_infohash" do
    get :show, id: @folder_infohash
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @folder_infohash
    assert_response :success
  end

  test "should update folder_infohash" do
    patch :update, id: @folder_infohash, folder_infohash: { folder_id: @folder_infohash.folder_id, infohash_id: @folder_infohash.infohash_id }
    assert_redirected_to folder_infohash_path(assigns(:folder_infohash))
  end

  test "should destroy folder_infohash" do
    assert_difference('FolderInfohash.count', -1) do
      delete :destroy, id: @folder_infohash
    end

    assert_redirected_to folder_infohashes_path
  end
end
