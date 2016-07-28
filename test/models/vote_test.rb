require 'test_helper'

class VoteTest < ActiveSupport::TestCase


	test "should add vote to issue from enabled poll" do
		issue = issues(:from_enabled_poll)

		vote = Vote.new(user: users(:one), issue: issue)
		assert_difference('issue.votes.count') do 
			assert_difference('Vote.count') do
				vote.save
			end
		end

	end

	test "should not add vote to issue from disabled poll" do
		issue = issues(:from_disabled_poll)
		vote = Vote.new(user: users(:one), issue: issue)
		assert_no_difference('issue.votes.count') do 
			assert_no_difference('Vote.count') do
				vote.save
			end
		end

	end


	test "should not create invalid votes" do

		issue = issues(:one)
		vote = Vote.new(user: users(:one), issue: nil)
		
		assert_no_difference('Vote.count') do
			assert_raises ActiveRecord::RecordInvalid do
				Vote.transaction do 
					vote.save!
				end
			end
		end
	end


end
