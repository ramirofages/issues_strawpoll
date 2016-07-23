class SourcesController < ApplicationController

  load_resource :project

  def show
  end

	def new
  	@my_project.project_source = create_source
	end

  def edit
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

  def update

    respond_to do |format|
      if @my_project.project_source.update(source_params)
        format.html { redirect_to my_project_path @my_project, notice: 'Mocked source was successfully updated.' }
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
    def source_params
      raise "no definiste el source params"
    end
end
