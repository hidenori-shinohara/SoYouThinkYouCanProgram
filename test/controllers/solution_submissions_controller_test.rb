require 'test_helper'

class SolutionSubmissionsControllerTest < ActionController::TestCase
  setup do
    @solution_submission = solution_submissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:solution_submissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create solution_submission" do
    assert_difference('SolutionSubmission.count') do
      post :create, solution_submission: { solition: @solution_submission.solition }
    end

    assert_redirected_to solution_submission_path(assigns(:solution_submission))
  end

  test "should show solution_submission" do
    get :show, id: @solution_submission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @solution_submission
    assert_response :success
  end

  test "should update solution_submission" do
    patch :update, id: @solution_submission, solution_submission: { solition: @solution_submission.solition }
    assert_redirected_to solution_submission_path(assigns(:solution_submission))
  end

  test "should destroy solution_submission" do
    assert_difference('SolutionSubmission.count', -1) do
      delete :destroy, id: @solution_submission
    end

    assert_redirected_to solution_submissions_path
  end
end
