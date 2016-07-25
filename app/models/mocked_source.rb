class MockedSource < ActiveRecord::Base
	has_one :project, as: :project_source

	def all_issues
		MockedIssue.all.map do |mocked_issue|
			translate_to_issue(mocked_issue)			
		end
	end

	def select_issues(issues_ids)
		#en el futuro la optimizo
		issues_ids.map do |mocked_issue_id|
			mocked_issue = MockedIssue.find(mocked_issue_id)
			translate_to_issue(mocked_issue)
		end
	end

	private

		def translate_to_issue (mocked_issue)
			Issue.new do |issue|
				issue.name 			= mocked_issue.name
				issue.description 	= mocked_issue.description
				issue.src_issue_id 	= mocked_issue.id
			end
		end
end
