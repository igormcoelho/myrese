require 'test_helper'

class GrantsControllerTest < ActionController::TestCase
  setup do
    @grant = grants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grant" do
    assert_difference('Grant.count') do
      post :create, grant: { description: @grant.description, end_date: @grant.end_date, funding_agency: @grant.funding_agency, name: @grant.name, number: @grant.number, profile_id: @grant.profile_id, project_id: @grant.project_id, start_date: @grant.start_date }
    end

    assert_redirected_to grant_path(assigns(:grant))
  end

  test "should show grant" do
    get :show, id: @grant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grant
    assert_response :success
  end

  test "should update grant" do
    patch :update, id: @grant, grant: { description: @grant.description, end_date: @grant.end_date, funding_agency: @grant.funding_agency, name: @grant.name, number: @grant.number, profile_id: @grant.profile_id, project_id: @grant.project_id, start_date: @grant.start_date }
    assert_redirected_to grant_path(assigns(:grant))
  end

  test "should destroy grant" do
    assert_difference('Grant.count', -1) do
      delete :destroy, id: @grant
    end

    assert_redirected_to grants_path
  end
end
