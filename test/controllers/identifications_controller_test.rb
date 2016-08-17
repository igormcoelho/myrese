require 'test_helper'

class IdentificationsControllerTest < ActionController::TestCase
  setup do
    @identification = identifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:identifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create identification" do
    assert_difference('Identification.count') do
      post :create, identification: { location: @identification.location, service: @identification.service, title: @identification.title }
    end

    assert_redirected_to identification_path(assigns(:identification))
  end

  test "should show identification" do
    get :show, id: @identification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @identification
    assert_response :success
  end

  test "should update identification" do
    patch :update, id: @identification, identification: { location: @identification.location, service: @identification.service, title: @identification.title }
    assert_redirected_to identification_path(assigns(:identification))
  end

  test "should destroy identification" do
    assert_difference('Identification.count', -1) do
      delete :destroy, id: @identification
    end

    assert_redirected_to identifications_path
  end
end
