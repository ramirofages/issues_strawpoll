class VoteValidator < ActiveModel::Validator
  def validate(record)
  	return unless record.errors.blank?
  	record.errors[:base] << "Cannot vote" unless record.issue.poll.accept_votes?
  end
end