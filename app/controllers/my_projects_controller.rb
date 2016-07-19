class MyProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @my_projects = Project.all
  end


  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @my_project = Project.new
    
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @my_project = Project.new(project_params)

    respond_to do |format|
      if @my_project.save
        format.html { redirect_to my_projects_url, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @my_project }
      else
        format.html { render :new }
        format.json { render json: @my_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @my_project.update(project_params)
        format.html { redirect_to my_project_path(@my_project), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_project }
      else
        format.html { render :edit }
        format.json { render json: @my_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @my_project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @my_project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :public, :description)
    end
end
