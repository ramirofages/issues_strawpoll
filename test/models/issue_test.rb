require 'test_helper'

class IssueTest < ActiveSupport::TestCase

	test "should create issue" do

		issue = Issue.new do |issue|
			issue.poll = polls(:without_issues)
			issue.src_issue_id = 4
			issue.name = "asd"
			issue.description = "asdasd"
		end

		assert_difference('Issue.count') do
			issue.save
		end
	end

	test "should not create issue without src_id" do

		issue = Issue.new do |issue|
			issue.poll = polls(:without_issues)
			issue.name = "asd"
			issue.description = "asdasd"
		end

		assert_no_difference('Issue.count') do
			issue.save
		end
	end

	test "should not create issue without poll" do

		issue = Issue.new do |issue|
			issue.name = "asd"
			issue.src_issue_id = 4
			issue.description = "asdasd"
		end

		assert_no_difference('Issue.count') do
			issue.save
		end
	end
end
