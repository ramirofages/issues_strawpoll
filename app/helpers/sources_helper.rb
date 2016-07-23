module SourcesHelper
	def source_path(project)
		user_project_path(project)+'/'+ project.project_source.model_name.param_key
	end
end
