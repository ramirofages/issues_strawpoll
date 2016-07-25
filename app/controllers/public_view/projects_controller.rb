class PublicView::ProjectsController < ApplicationController
  skip_before_action :authenticate_user!
  
  load_and_authorize_resource


  # GET /projects
  # GET /projects.json 

  def index

  end


  # GET /projects/1
  # GET /projects/1.json
  def show

  end

end
