require 'test_helper'

class User::ProjectsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  setup do
    @project = projects(:one)
  end

  test "should not get index when signed out" do
    get :index
    assert_response :redirect
    assert_nil assigns(:projects)
  end

  test "should get index when signed in" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create project" do
    sign_in users(:one)
    assert_difference('Project.count') do
      post :create, project: { description: @project.description, name: @project.name, project_source_id: @project.project_source_id, public: @project.public }
    end
    assert_redirected_to user_projects_path
  end


  test "should not show project when signed out" do
    project = projects(:one)
    get :show, id: project
    assert_response :redirect
  end
end
