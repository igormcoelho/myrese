require 'test_helper'

class PkeywordsControllerTest < ActionController::TestCase
  setup do
    @pkeyword = pkeywords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pkeywords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pkeyword" do
    assert_difference('Pkeyword.count') do
      post :create, pkeyword: { infohash_id: @pkeyword.infohash_id, keyword: @pkeyword.keyword, publication_id: @pkeyword.publication_id }
    end

    assert_redirected_to pkeyword_path(assigns(:pkeyword))
  end

  test "should show pkeyword" do
    get :show, id: @pkeyword
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pkeyword
    assert_response :success
  end

  test "should update pkeyword" do
    patch :update, id: @pkeyword, pkeyword: { infohash_id: @pkeyword.infohash_id, keyword: @pkeyword.keyword, publication_id: @pkeyword.publication_id }
    assert_redirected_to pkeyword_path(assigns(:pkeyword))
  end

  test "should destroy pkeyword" do
    assert_difference('Pkeyword.count', -1) do
      delete :destroy, id: @pkeyword
    end

    assert_redirected_to pkeywords_path
  end
end
