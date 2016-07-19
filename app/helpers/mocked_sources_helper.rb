module MockedSourcesHelper
	
	def set_source_decorator
		@my_project.project_source = MockedSourceDecorator.new(@my_project.project_source) 
	end	

end
