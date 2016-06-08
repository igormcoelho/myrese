require 'test_helper'

class InforelationsControllerTest < ActionController::TestCase
  setup do
    @inforelation = inforelations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inforelations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inforelation" do
    assert_difference('Inforelation.count') do
      post :create, inforelation: { infohash1: @inforelation.infohash1, infohash2: @inforelation.infohash2 }
    end

    assert_redirected_to inforelation_path(assigns(:inforelation))
  end

  test "should show inforelation" do
    get :show, id: @inforelation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inforelation
    assert_response :success
  end

  test "should update inforelation" do
    patch :update, id: @inforelation, inforelation: { infohash1: @inforelation.infohash1, infohash2: @inforelation.infohash2 }
    assert_redirected_to inforelation_path(assigns(:inforelation))
  end

  test "should destroy inforelation" do
    assert_difference('Inforelation.count', -1) do
      delete :destroy, id: @inforelation
    end

    assert_redirected_to inforelations_path
  end
end
