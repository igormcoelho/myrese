require 'test_helper'

class GfilesControllerTest < ActionController::TestCase
  setup do
    @gfile = gfiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gfile" do
    assert_difference('Gfile.count') do
      post :create, gfile: { description: @gfile.description, infohash_id: @gfile.infohash_id, name: @gfile.name, size: @gfile.size }
    end

    assert_redirected_to gfile_path(assigns(:gfile))
  end

  test "should show gfile" do
    get :show, id: @gfile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gfile
    assert_response :success
  end

  test "should update gfile" do
    patch :update, id: @gfile, gfile: { description: @gfile.description, infohash_id: @gfile.infohash_id, name: @gfile.name, size: @gfile.size }
    assert_redirected_to gfile_path(assigns(:gfile))
  end

  test "should destroy gfile" do
    assert_difference('Gfile.count', -1) do
      delete :destroy, id: @gfile
    end

    assert_redirected_to gfiles_path
  end
end
