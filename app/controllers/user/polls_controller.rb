class PrivateView::PollsController < ApplicationController
  before_action :set_project
  before_action :set_poll, except: [:new, :create]
  before_action :validate_source


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
    @poll.expiration_date = Date.today + poll_duration.to_i

    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to my_project_poll_path(@project, @poll), notice: 'Poll was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to my_project_path(@project), notice: 'Poll was successfully destroyed.' }
    end
  end

  private

    def set_project
      @project = Project.find(params[:my_project_id])
    end

    def set_poll
      @poll = Poll.find(params[:id])
    end

    def poll_params
      params.require(:poll).permit(:name, :description)
    end
    def poll_duration
      params.require(:poll).permit(:expiration_date)[:expiration_date]
    end

    def issues_ids
      issues = params.require(:poll).require(:issues)
      issues.pop #el ultimo elemento siempre es un string vacio que no nos sirve
      issues 
    end

    def validate_source
      if @project.project_source.nil? 
        redirect_to my_project_path(@project), alert: 'Project has no source. Create source first.'
      end
    end
end
