class Poll < ActiveRecord::Base

  validates :project_id, :name, presence: true
  validates_inclusion_of :enabled, :in => [true, false]
  validates :issues, presence: true
	validates_with PollValidator

  belongs_to :project
  has_many :issues, dependent: :destroy
  

  def accept_votes?
  	(expiration_date - Date.today)>= 0 and enabled
  end

  def votes
    issues.flat_map {|issue| issue.votes }
  end
end
