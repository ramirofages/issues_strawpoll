class SourcesController < ApplicationController

  load_and_authorize_resource :project
  before_action :authorize_source, only: [:new, :create]

  def show
  end

	def new
  	@project.project_source = create_source
	end

  def edit
  end

	def create
		@project.project_source = build_source
  		
    respond_to do |format|
      if @project.save
        format.html { redirect_to user_project_path @project, notice: 'Source was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update

    respond_to do |format|
      if @project.project_source.update(source_params)
        format.html { redirect_to user_project_path @project, notice: 'Source was successfully updated.' }
      else
        format.html { render :new }
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
    def source_params
      raise "no definiste el source params"
    end

  private 
    def authorize_source
      authorize! :create_source, @project
    end
end
