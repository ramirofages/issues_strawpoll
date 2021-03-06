class User::PollsController < ApplicationController
  load_and_authorize_resource :project, :through => :current_user
  load_and_authorize_resource :through => :project



  def show
  end

  def new
    @issues = @project.project_source.all_issues
    respond_to do |format|
      format.html { redirect_to user_project_path(@project), notice: 'There are no open issues available.' }
    end unless @issues.size > 0

  end

  def edit
  end

  def enable_disable
    @poll.update(enabled: !@poll.enabled)
    respond_to do |format|
      format.html { redirect_to user_project_poll_path(@project, @poll), notice: 'Poll was successfully updated.' }
    end
  end

  def create

    @poll.issues = @project.project_source.select_issues(issues_ids)
    @poll.expiration_date = Date.today + poll_duration.to_i
    respond_to do |format|
      if @project.polls << @poll 
        format.html { redirect_to user_project_url(@project), notice: 'Poll was successfully created.' }
      else
        @issues = @project.project_source.all_issues
        format.html { render :new }
      end
    end
  end

  def update
    @poll.expiration_date = Date.today + poll_duration.to_i

    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to user_project_poll_path(@project, @poll), notice: 'Poll was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to user_project_path(@project), notice: 'Poll was successfully destroyed.' }
    end
  end

  private


    def poll_params
      params.require(:poll).permit(:name, :description, :enabled)
    end
    def poll_duration
      params.require(:poll).permit(:expiration_date)[:expiration_date]
    end

    def issues_ids
      issues = params.require(:poll).require(:issues)
      issues.pop #el ultimo elemento siempre es un string vacio que no nos sirve
      issues 
    end

end
