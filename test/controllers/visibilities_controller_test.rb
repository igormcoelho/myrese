require 'test_helper'

class VisibilitiesControllerTest < ActionController::TestCase
  setup do
    @visibility = visibilities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visibilities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visibility" do
    assert_difference('Visibility.count') do
      post :create, visibility: { type: @visibility.type }
    end

    assert_redirected_to visibility_path(assigns(:visibility))
  end

  test "should show visibility" do
    get :show, id: @visibility
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @visibility
    assert_response :success
  end

  test "should update visibility" do
    patch :update, id: @visibility, visibility: { type: @visibility.type }
    assert_redirected_to visibility_path(assigns(:visibility))
  end

  test "should destroy visibility" do
    assert_difference('Visibility.count', -1) do
      delete :destroy, id: @visibility
    end

    assert_redirected_to visibilities_path
  end
end
