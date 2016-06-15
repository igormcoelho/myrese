require 'test_helper'

class PubtypesControllerTest < ActionController::TestCase
  setup do
    @pubtype = pubtypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pubtypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pubtype" do
    assert_difference('Pubtype.count') do
      post :create, pubtype: { name: @pubtype.name }
    end

    assert_redirected_to pubtype_path(assigns(:pubtype))
  end

  test "should show pubtype" do
    get :show, id: @pubtype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pubtype
    assert_response :success
  end

  test "should update pubtype" do
    patch :update, id: @pubtype, pubtype: { name: @pubtype.name }
    assert_redirected_to pubtype_path(assigns(:pubtype))
  end

  test "should destroy pubtype" do
    assert_difference('Pubtype.count', -1) do
      delete :destroy, id: @pubtype
    end

    assert_redirected_to pubtypes_path
  end
end
