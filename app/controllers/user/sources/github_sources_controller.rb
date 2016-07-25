class User::Sources::GithubSourcesController < SourcesController
  

	protected

		def create_source
      GithubSource.new
    end

    def build_source
	    GithubSource.new(source_params)
    end

    def source_params
      params.require(:github_source).permit(:repo_url, :include_pull_request)
    end

end
