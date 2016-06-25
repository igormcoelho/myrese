require 'test_helper'

class PublicationProfilesControllerTest < ActionController::TestCase
  setup do
    @publication_profile = publication_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:publication_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create publication_profile" do
    assert_difference('PublicationProfile.count') do
      post :create, publication_profile: { author: @publication_profile.author, profile_id: @publication_profile.profile_id, publication_id: @publication_profile.publication_id }
    end

    assert_redirected_to publication_profile_path(assigns(:publication_profile))
  end

  test "should show publication_profile" do
    get :show, id: @publication_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @publication_profile
    assert_response :success
  end

  test "should update publication_profile" do
    patch :update, id: @publication_profile, publication_profile: { author: @publication_profile.author, profile_id: @publication_profile.profile_id, publication_id: @publication_profile.publication_id }
    assert_redirected_to publication_profile_path(assigns(:publication_profile))
  end

  test "should destroy publication_profile" do
    assert_difference('PublicationProfile.count', -1) do
      delete :destroy, id: @publication_profile
    end

    assert_redirected_to publication_profiles_path
  end
end
