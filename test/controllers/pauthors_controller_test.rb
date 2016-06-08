require 'test_helper'

class PauthorsControllerTest < ActionController::TestCase
  setup do
    @pauthor = pauthors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pauthors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pauthor" do
    assert_difference('Pauthor.count') do
      post :create, pauthor: { publication_id: @pauthor.publication_id, user_id: @pauthor.user_id }
    end

    assert_redirected_to pauthor_path(assigns(:pauthor))
  end

  test "should show pauthor" do
    get :show, id: @pauthor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pauthor
    assert_response :success
  end

  test "should update pauthor" do
    patch :update, id: @pauthor, pauthor: { publication_id: @pauthor.publication_id, user_id: @pauthor.user_id }
    assert_redirected_to pauthor_path(assigns(:pauthor))
  end

  test "should destroy pauthor" do
    assert_difference('Pauthor.count', -1) do
      delete :destroy, id: @pauthor
    end

    assert_redirected_to pauthors_path
  end
end
