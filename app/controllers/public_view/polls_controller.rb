class PublicView::PollsController < ApplicationController
  skip_before_action :authenticate_user!

  load_and_authorize_resource 

  def show
  end

end
