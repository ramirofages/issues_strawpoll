class User::ProjectsController < ApplicationController

  load_resource :project
  #before_action :authorize_my_project, except: [:index]
  # GET /projects
  def index
    @projects = current_user.projects
  end



  # GET /projects/1
  def show
  end

  # GET /projects/new
  def new
  end

  def new_source
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project.user = current_user

    respond_to do |format|
      if @project.save
        format.html { redirect_to user_projects_path, notice: 'Project was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /projects/1
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to user_project_path(@project), notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to user_projects_path, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :public, :description)
    end
end
