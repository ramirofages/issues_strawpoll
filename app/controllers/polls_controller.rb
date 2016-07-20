class PollsController < ApplicationController
  before_action :set_project


  def show
  end

  def new
    @poll = Poll.new
    @issues = @project.project_source.all_issues
  end

  def edit
  end


  def create
    @poll = Poll.new(poll_params)
    @poll.issues = @project.project_source.select_issues(issues_ids)
    @poll.expiration_date = Date.today + poll_duration.to_i
    respond_to do |format|
      if @project.polls << @poll 
        format.html { redirect_to my_project_url(@project), notice: 'Poll was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
  end

  def destroy
  end

  private

    def set_project
      @project = Project.find(params[:my_project_id])
    end

    def poll_params
      params.require(:poll).permit(:name, :description)
    end
    def poll_duration
      params.require(:poll).permit(:duration)[:duration]
    end

    def issues_ids
      issues = params.require(:poll).require(:issues)
      issues.pop #el ultimo elemento siempre es un string vacio que no nos sirve
      issues 
    end
end
