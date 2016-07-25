module SourcesHelper
	def source_path(project)
		user_project_path(project)+'/'+ project.project_source.model_name.param_key
	end

	def source_name(source)
		(source.nil?)? 'none' : source.class.model_name.human.split('source').first
	end
end
