class Poll < ActiveRecord::Base

  validates :project_id, :name, presence: true
  validates_inclusion_of :enabled, :in => [true, false]
  validates :issues, presence: true
	validates_with PollValidator

  belongs_to :project
  has_many :issues
  has_many :votes, dependent: :destroy
  

  def accept_votes?
  	(expiration_date - Date.today)>= 0 and enabled
  end
end
