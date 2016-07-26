class Poll < ActiveRecord::Base

  validates :project_id, :name, :enabled, presence: true
  validates :issues, presence: true
	validates_with ProjectHasSourceValidator

  belongs_to :project
  has_many :issues
  has_many :votes, dependent: :destroy
  

  def accept_votes?
  	(expiration_date - Date.today)>= 0 and enabled
  end
end
