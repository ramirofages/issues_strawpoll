class Issue < ActiveRecord::Base

  validates :poll_id, :src_issue_id, :name, :description, presence: true



  belongs_to :poll
  has_many :votes
end
