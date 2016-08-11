require 'test_helper'

class InfohashMembersControllerTest < ActionController::TestCase
  setup do
    @infohash_member = infohash_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:infohash_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create infohash_member" do
    assert_difference('InfohashMember.count') do
      post :create, infohash_member: { author: @infohash_member.author, identification: @infohash_member.identification, infohash_id: @infohash_member.infohash_id }
    end

    assert_redirected_to infohash_member_path(assigns(:infohash_member))
  end

  test "should show infohash_member" do
    get :show, id: @infohash_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @infohash_member
    assert_response :success
  end

  test "should update infohash_member" do
    patch :update, id: @infohash_member, infohash_member: { author: @infohash_member.author, identification: @infohash_member.identification, infohash_id: @infohash_member.infohash_id }
    assert_redirected_to infohash_member_path(assigns(:infohash_member))
  end

  test "should destroy infohash_member" do
    assert_difference('InfohashMember.count', -1) do
      delete :destroy, id: @infohash_member
    end

    assert_redirected_to infohash_members_path
  end
end
