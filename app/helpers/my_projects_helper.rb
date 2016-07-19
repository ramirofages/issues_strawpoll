module MyProjectsHelper

	def visibility(project)
		(project.public) ? 'PUBLIC' : 'PRIVATE'
	end
end
