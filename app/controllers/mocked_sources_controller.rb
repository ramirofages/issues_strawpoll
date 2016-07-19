class MockedSourcesController < ApplicationController

	before_action :set_project

  def show
  	@my_project.project_source = source_decorator  	
  end

	def new
  	@my_project.project_source = MockedSource.new
	end

	def create
		@my_project.project_source = MockedSource.new(source_params)
  		
    respond_to do |format|
      if @my_project.save
        format.html { redirect_to my_project_path @my_project, notice: 'Mocked source was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


	private

		def source_decorator
			MockedSourceDecorator.new(@my_project.project_source) 
		end

    def source_params
       params.require(:mocked_source).permit(:url)
    end

    def set_project
      @my_project = Project.find(params[:my_project_id])
    end
end
