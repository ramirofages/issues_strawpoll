class Vote < ActiveRecord::Base

  validates :user_id, :poll_id, presence: true
	validates_with AcceptVotesValidator

  belongs_to :issue
  belongs_to :user
  belongs_to :poll
end
