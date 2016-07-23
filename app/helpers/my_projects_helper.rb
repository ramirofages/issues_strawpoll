module MyProjectsHelper

	def visibility(project)
		(project.public) ? 'PUBLIC' : 'PRIVATE'
	end
	def visibility_icon(project)
		(project.public) ? 'lock_open' : 'lock'
	end

	def set_source_decorator
		@project.project_source = @project.project_source.decorate 
	end

	def set_source_collection_decorator	
		@projects.each do |project|
			project.project_source =project.project_source.decorate unless project.project_source.nil?
		end
	end

	def source_name(project)
		(project.project_source.nil?) ? 'none' : project.project_source.name
	end

	def is_owner?(project)
		project.user == current_user
	end
end
