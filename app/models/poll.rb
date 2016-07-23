class Poll < ActiveRecord::Base
  belongs_to :project
  has_many :issues
  has_many :votes

end
