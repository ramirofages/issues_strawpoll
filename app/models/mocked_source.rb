class MockedSource < ActiveRecord::Base
	has_one :project, as: :project_source

	def retrieve_issues
		MockedIssue.all
	end
end
