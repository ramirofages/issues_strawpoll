module MyProjectsHelper

	def visibility(project)
		(project.public) ? 'PUBLIC' : 'PRIVATE'
	end
	def visibility_icon(project)
		(project.public) ? 'lock_open' : 'lock'
	end


	def is_owner?(project)
		project.user == current_user
	end
end
