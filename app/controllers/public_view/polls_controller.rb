class PublicView::PollsController < ApplicationController
  skip_before_action :authenticate_user!

  load_resource 

  def show
  end

end
