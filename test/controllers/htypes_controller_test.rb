require 'test_helper'

class HtypesControllerTest < ActionController::TestCase
  setup do
    @htype = htypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:htypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create htype" do
    assert_difference('Htype.count') do
      post :create, htype: { name: @htype.name }
    end

    assert_redirected_to htype_path(assigns(:htype))
  end

  test "should show htype" do
    get :show, id: @htype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @htype
    assert_response :success
  end

  test "should update htype" do
    patch :update, id: @htype, htype: { name: @htype.name }
    assert_redirected_to htype_path(assigns(:htype))
  end

  test "should destroy htype" do
    assert_difference('Htype.count', -1) do
      delete :destroy, id: @htype
    end

    assert_redirected_to htypes_path
  end
end
