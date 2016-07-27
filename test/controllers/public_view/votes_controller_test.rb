require 'test_helper'

class PublicView::VotesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers



  test "should NOT get new when signed out" do
		poll = polls(:from_project_one) 

    get :new, project_id: poll.project, poll_id: poll

    assert_response :redirect
  end

  test "should NOT get new on closed or expired poll" do
    sign_in users(:one)
    
    poll = polls(:expired) 

    get :new, project_id: poll.project, poll_id: poll

    assert_response :redirect
  end

  test "should get new when signed in as the owner of the poll" do
  	sign_in users(:one)

		poll = polls(:from_project_one) 

    get :new, project_id: poll.project, poll_id: poll

    assert_response :success
  end

  test "should get new when signed in as another user" do
  	sign_in users(:three)

		poll = polls(:from_project_one) 

    get :new, project_id: poll.project, poll_id: poll

    assert_response :success
  end

end
