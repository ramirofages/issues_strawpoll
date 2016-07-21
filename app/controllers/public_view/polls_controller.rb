class PublicView::PollsController < ApplicationController

  before_action :set_poll


  def show
  end

  def vote
  end

  def new_vote

  end



  private

	  def set_poll
	    @poll = Poll.find(params[:id])
	  end

end
