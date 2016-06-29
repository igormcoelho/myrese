require 'test_helper'

class QualisEvaluateJournalsControllerTest < ActionController::TestCase
  setup do
    @qualis_evaluate_journal = qualis_evaluate_journals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qualis_evaluate_journals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qualis_evaluate_journal" do
    assert_difference('QualisEvaluateJournal.count') do
      post :create, qualis_evaluate_journal: { evaluation_id: @qualis_evaluate_journal.evaluation_id, profile_id: @qualis_evaluate_journal.profile_id, target_qualis: @qualis_evaluate_journal.target_qualis, year_begin: @qualis_evaluate_journal.year_begin, year_end: @qualis_evaluate_journal.year_end }
    end

    assert_redirected_to qualis_evaluate_journal_path(assigns(:qualis_evaluate_journal))
  end

  test "should show qualis_evaluate_journal" do
    get :show, id: @qualis_evaluate_journal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qualis_evaluate_journal
    assert_response :success
  end

  test "should update qualis_evaluate_journal" do
    patch :update, id: @qualis_evaluate_journal, qualis_evaluate_journal: { evaluation_id: @qualis_evaluate_journal.evaluation_id, profile_id: @qualis_evaluate_journal.profile_id, target_qualis: @qualis_evaluate_journal.target_qualis, year_begin: @qualis_evaluate_journal.year_begin, year_end: @qualis_evaluate_journal.year_end }
    assert_redirected_to qualis_evaluate_journal_path(assigns(:qualis_evaluate_journal))
  end

  test "should destroy qualis_evaluate_journal" do
    assert_difference('QualisEvaluateJournal.count', -1) do
      delete :destroy, id: @qualis_evaluate_journal
    end

    assert_redirected_to qualis_evaluate_journals_path
  end
end
