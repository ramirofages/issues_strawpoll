class GithubSource < ActiveRecord::Base

  validates :repo_url, presence: true
  validates_inclusion_of :include_pull_request, :in => [true, false]

	has_one :project, as: :project_source

	def all_issues
		GithubService.issues_for(repo_url,include_pull_request)
	end

	def select_issues(issues_ids)
		GithubService.selected_issues_for(repo_url,issues_ids)
	end
end
