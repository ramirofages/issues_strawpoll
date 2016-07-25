class Poll < ActiveRecord::Base
  belongs_to :project
  has_many :issues
  has_many :votes, dependent: :destroy
  

  def accept_votes?
  	(expiration_date - Date.today)>= 0 and enabled
  end
end
