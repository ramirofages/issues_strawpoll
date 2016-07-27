require 'test_helper'

class PublicView::PollsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test "should get show when signed in" do
  	sign_in users(:one)
    poll = polls(:from_project_one) 

    get :show, project_id: poll.project, id: poll

    assert_response :success
  end

  test "should get show when signed out and on public project" do
    poll = polls(:from_public_project) 

    get :show, project_id: poll.project, id: poll

    assert_response :success
  end

  test "should not get show when signed out and on private project" do
    poll = polls(:from_private_project) 

    get :show, project_id: poll.project, id: poll

    assert_response :redirect
  end

end
