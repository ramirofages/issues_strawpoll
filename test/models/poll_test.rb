require 'test_helper'

class PollTest < ActiveSupport::TestCase


	test "should not create poll on project without source" do
	  project = projects(:without_source)
		poll = Poll.new do |poll|
			poll.project = project 
			poll.name = "asd"
			poll.enabled = true
			poll.issues << issues(:one)
		end
		assert_no_difference('Poll.count') do
			poll.save
		end
	end

	test "should not create poll without issues" do
	  project = projects(:with_source)
		poll = Poll.new do |poll|
			poll.project = project 
			poll.name = "asd"
			poll.enabled = true
		end

		assert_no_difference('Poll.count') do
			poll.save
		end
	end

	test "should create poll" do
	  project = projects(:with_source)
		poll = Poll.new do |poll|
			poll.project = project 
			poll.name = "asd"
			poll.enabled = true
			poll.issues << issues(:one)

		end


		assert_difference('Poll.count') do
			poll.save
		end


	end

end
