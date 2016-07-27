require 'test_helper'

class ProjectTest < ActiveSupport::TestCase




  test "should create project without source" do 

  	new_project = Project.new do |project| 
  		project.name = "asd"
  		project.description = "chau"
  		project.public = false
  	end

  	assert_difference('Project.count') do
			new_project.save
		end


  end

end
