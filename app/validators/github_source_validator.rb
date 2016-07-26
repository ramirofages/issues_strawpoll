class GithubSourceValidator < ActiveModel::Validator
  def validate(record)

  	error_messages = GithubService.repository_valid? record.repo_url
  	error_messages.each do |message|
  		record.errors[:base] << message 
  	end unless error_messages.empty?
  end
end