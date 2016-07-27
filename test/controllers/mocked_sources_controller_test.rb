require 'test_helper'

class User::Sources::MockedSourcesControllerTest < ActionController::TestCase
  	
  include Devise::Test::ControllerHelpers

  test "should get new on project without source" do

    sign_in users(:one)

    get :new, project_id: projects(:without_source)

    assert_response :success
  end

  test "should not get new on project with source" do

    sign_in users(:one)

    get :new, project_id: projects(:with_source)

    assert_response :redirect
  end

  test "should not get new on unowned project" do

    sign_in users(:three)

    get :new, project_id: projects(:without_source)

    assert_response :redirect
  end

end
