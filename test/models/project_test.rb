require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

	setup do
		@project = Project.new
	end


  test "project should not create source if already has one" do 
  	@project.project_source = MockedSource.new
  	assert_difference('Project.count') do
			@project.save
		end

  	@project.project_source = GithubSource.new
		assert_no_difference('GithubSource.count') do
			@project.save
		end
  end

end
