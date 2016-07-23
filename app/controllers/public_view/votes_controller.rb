class PublicView::VotesController < ApplicationController
	load_resource :project
	load_resource :poll
	before_action :authorize_poll

  def new
  end

  def create

    votes = Issue.where(id: issues_ids).map do | issue |
    	vote = Vote.new(issue: issue, user: current_user)
    end

   
    respond_to do |format|
      if @poll.votes << votes 
        format.html { redirect_to project_poll_path(@project,@poll), notice: 'Project was successfully created.' }
      else
        format.html { render :new }
      end
    end

  end


  private

  	def authorize_poll
  		authorize! :vote, @poll
  	end

	  def issues_ids

	    voted_issues = params.require(:votes)[:id]
	    voted_issues.pop #el ultimo elemento siempre es un string vacio que no nos sirve
	    voted_issues 
	  end
end
