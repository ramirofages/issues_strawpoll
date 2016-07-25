class GithubSource < ActiveRecord::Base
	has_one :project, as: :project_source

	def all_issues
		GithubService.issues_for(repo_url,include_pull_request)
	end

	def select_issues(issues_ids)
		GithubService.selected_issues_for(repo_url,issues_ids)
	end
end
