require 'test_helper'

class User::PollsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers



  test "should get show when signed in" do
    sign_in users(:one)
    poll = polls(:from_project_one)

    get :show, project_id: poll.project, id: poll

    assert_response :success
  end
  
  test "should not get show when signed out" do
    poll = polls(:from_project_one)

    get :show, project_id: poll.project, id: poll

    assert_response :redirect
  end

  test "should not get show on unauthorized poll" do
    sign_in users(:without_projects)

    poll = polls(:from_project_one) #from other user

    get :show, project_id: poll.project, id: poll

    assert_response :redirect
  end


  test "should not get new on project without source" do
    sign_in users(:one)
    get :new, project_id: projects(:without_source)

    assert_response :redirect
  end

  test "should get new on project with source" do
    sign_in users(:one)
    get :new, project_id: projects(:with_source)

    assert_response :success
  end

end
