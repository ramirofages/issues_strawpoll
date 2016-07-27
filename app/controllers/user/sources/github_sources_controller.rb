class User::Sources::GithubSourcesController < User::SourcesController
  

	protected

    def source_params
      params.require(:github_source).permit(:repo_url, :include_pull_request)
    end


end
