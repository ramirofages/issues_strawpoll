class Projects::MockedController < ProjectsController

	def create_source
		MockedSource.new
	end

	def build_source
		MockedSource.new(source_params)
	end

	private

    def source_params
       params.require(:project).permit(source_project_attributes: [:url])
    end
end
