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



  test "should show public project" do
    public_project = projects(:public)
    get :show, id: public_project
    assert_response :success
  end

  test "should not show private project when signed out" do
    private_project = projects(:private)
    get :show, id: private_project
    assert_response :redirect
  end

  test "should show private project when signed in" do
    sign_in users :one
    private_project = projects(:private)
    get :show, id: private_project
    assert_response :success
  end

end
