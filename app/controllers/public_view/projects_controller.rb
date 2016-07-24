class PublicView::ProjectsController < ApplicationController
  skip_before_action :authenticate_user!
  
  load_resource 

  # GET /projects
  # GET /projects.json 

  def index
    @projects = Project.all
  end


  # GET /projects/1
  # GET /projects/1.json
  def show
  end

end
