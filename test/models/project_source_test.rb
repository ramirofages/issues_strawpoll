require 'test_helper'

class ProjectSourceTest < ActiveSupport::TestCase


	test "should not create source if project already has a source" do
	  project = projects(:with_source)

		source = MockedSource.new do |mocked_source|
			mocked_source.url = "asd"
			mocked_source.project = project			
		end

		assert_no_difference('MockedSource.count') do
			source.save
		end

	end

	test "should create source on project without source" do
	  project = projects(:without_source)

		source = MockedSource.new do |mocked_source|
			mocked_source.url = "asd"
			mocked_source.project = project			
		end

		assert_difference('MockedSource.count') do
			source.save
		end

	end


end
