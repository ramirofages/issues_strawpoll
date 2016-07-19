module MyProjectsHelper

	def visibility(project)
		(project.public) ? 'PUBLIC' : 'PRIVATE'
	end

	def set_source_decorator
		@my_project.project_source = @my_project.project_source.decorate 
	end	
end
