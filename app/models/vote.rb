class Vote < ActiveRecord::Base

  validates :user_id, :issue_id, presence: true
	validates_with VoteValidator

  belongs_to :issue
  belongs_to :user
end
