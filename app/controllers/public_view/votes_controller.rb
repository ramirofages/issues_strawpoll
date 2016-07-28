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
      begin
        Vote.transaction{ votes.each(&:save!) }

      rescue ActiveRecord::RecordInvalid => exception
        format.html { redirect_to project_poll_path(@project,@poll), alert: exception.message }
      else
        format.html { redirect_to project_poll_path(@project,@poll), notice: 'Vote was successfully sent.' }
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
