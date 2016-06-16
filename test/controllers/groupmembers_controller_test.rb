require 'test_helper'

class GroupmembersControllerTest < ActionController::TestCase
  setup do
    @groupmember = groupmembers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groupmembers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create groupmember" do
    assert_difference('Groupmember.count') do
      post :create, groupmember: { group_id: @groupmember.group_id, user_id: @groupmember.user_id }
    end

    assert_redirected_to groupmember_path(assigns(:groupmember))
  end

  test "should show groupmember" do
    get :show, id: @groupmember
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @groupmember
    assert_response :success
  end

  test "should update groupmember" do
    patch :update, id: @groupmember, groupmember: { group_id: @groupmember.group_id, user_id: @groupmember.user_id }
    assert_redirected_to groupmember_path(assigns(:groupmember))
  end

  test "should destroy groupmember" do
    assert_difference('Groupmember.count', -1) do
      delete :destroy, id: @groupmember
    end

    assert_redirected_to groupmembers_path
  end
end
