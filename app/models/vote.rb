class Vote < ActiveRecord::Base

	validates_with AcceptVotesValidator

  belongs_to :issue
  belongs_to :user
  belongs_to :poll
end
