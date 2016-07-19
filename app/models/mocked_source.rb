class MockedSource < ActiveRecord::Base
	has_one :project, as: :project_source

	def retrieve_issues
		MockedIssue.all.map do |mocked_issue|

			Issue.new do |issue|
				issue.name 			= mocked_issue.name
				issue.description 	= mocked_issue.description
				issue.src_issue_id 	= mocked_issue.id
			end
			
		end
	end
end
