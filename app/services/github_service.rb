class GithubService
	def self.issues_for(repository_url, include_pull_request)
		issues = get_issues(repository_url)

		issues = issues.select do |issue| 
			issue['pull_request'].nil?
		end unless include_pull_request

		issues.map do |issue|
			to_issue issue
		end

	end

	def self.selected_issues_for(repository_url, issues_ids)
		issues = get_issues(repository_url)

		issues = issues.select do |issue|
			issues_ids.include? issue.id.to_s
		end

		issues.map do |issue|
			to_issue issue
		end
	end

	private

		def self.get_issues(repository_url)
			client = Octokit::Client.new
			client.issues repository_url, :status => 'open'
		end

		def self.to_issue(github_issue)
			Issue.new do |issue|
				issue.name 			= github_issue.title
				issue.description 	= github_issue.body
				issue.src_issue_id 	= github_issue.id
			end
		end
end