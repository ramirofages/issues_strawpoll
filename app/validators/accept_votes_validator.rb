class AcceptVotesValidator < ActiveModel::Validator
  def validate(record)
  	record.errors[:base] << "Cannot vote" unless record.poll.accept_votes?
  end
end