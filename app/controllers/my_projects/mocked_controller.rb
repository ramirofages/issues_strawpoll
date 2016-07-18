class MyProjects::MockedController < MyProjectsController

	def create_source
		MockedSource.new
	end

	def build_source
		MockedSource.new(source_params)
	end

	private

    def source_params
       params.require(:project).require(:project_source).permit(:url)
    end
end