class SourcesController < ApplicationController

	before_action :set_project

  def show
  end

	def new
  	@my_project.project_source = create_source

	end

	def create
		@my_project.project_source = build_source
  		
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

  protected 
    def create_source
      raise "no definiste el create source"
    end
    def build_source
      raise "no definiste el create source"
    end

	private

    def set_project
      @my_project = Project.find(params[:my_project_id])
    end
end
