require 'test_helper'

class WeblinksControllerTest < ActionController::TestCase
  setup do
    @weblink = weblinks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weblinks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weblink" do
    assert_difference('Weblink.count') do
      post :create, weblink: { infohash_id: @weblink.infohash_id, link: @weblink.link }
    end

    assert_redirected_to weblink_path(assigns(:weblink))
  end

  test "should show weblink" do
    get :show, id: @weblink
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weblink
    assert_response :success
  end

  test "should update weblink" do
    patch :update, id: @weblink, weblink: { infohash_id: @weblink.infohash_id, link: @weblink.link }
    assert_redirected_to weblink_path(assigns(:weblink))
  end

  test "should destroy weblink" do
    assert_difference('Weblink.count', -1) do
      delete :destroy, id: @weblink
    end

    assert_redirected_to weblinks_path
  end
end
