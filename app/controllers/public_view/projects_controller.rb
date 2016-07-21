class PublicView::ProjectsController < ApplicationController
  skip_before_action :authenticate_user!
  
  before_action :set_project, only: [:show]

  # GET /projects
  # GET /projects.json

  def index
    if user_signed_in?
      @projects = Project.all
    else
      @projects = Project.all.where public: true
    end
  end


  # GET /projects/1
  # GET /projects/1.json
  def show
  end






  private

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

end
