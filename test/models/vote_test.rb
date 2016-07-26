require 'test_helper'

class VoteTest < ActiveSupport::TestCase

	setup do


	end

	test "should add vote to enabled poll" do
		poll = polls(:enabled)
		vote = Vote.new do |vote|
			vote.poll = poll
		end

  	assert_difference('Vote.count') do
			poll.votes << vote
		end

	end

	test "should not add vote to disabled poll" do
		poll = polls(:disabled)
		vote = Vote.new do |vote|
			vote.poll = poll
		end

  	assert_no_difference('Vote.count') do
			poll.votes << vote
		end

	end
end
