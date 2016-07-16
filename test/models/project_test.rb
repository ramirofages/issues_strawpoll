require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

	setup do
		@project = Project.new
	end

  test "polymorphic association" do
  	
  	@project.project_source = MockedSource.new

  	assert_difference('Project.count') do
			@project.save
		end

		assert_nothing_raised do
  		created_project = Project.all.last.project_source.retrieve_issues
		end

  end

end
