require 'test_helper'

class PublicView::ProjectsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create project" do
  #   assert_difference('Project.count') do
  #     post :create, project: { description: @project.description, name: @project.name, project_source_id: @project.project_source_id, public: @project.public }
  #   end

  #   assert_redirected_to project_path(assigns(:project))
  # end

  test "should show public project" do
    public_project = projects(:public)
    get :show, id: public_project
    assert_response :success
  end

  test "should not show private project" do
    public_project = projects(:private)
    get :show, id: public_project
    assert_response :redirect
  end

  # test "should get edit" do
  #   get :edit, id: @project
  #   assert_response :success
  # end

  # test "should update project" do
  #   patch :update, id: @project, project: { description: @project.description, name: @project.name, project_source_id: @project.project_source_id, public: @project.public }
  #   assert_redirected_to project_path(assigns(:project))
  # end

  # test "should destroy project" do
  #   assert_difference('Project.count', -1) do
  #     delete :destroy, id: @project
  #   end

  #   assert_redirected_to projects_path
  # end
end
