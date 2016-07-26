class Issue < ActiveRecord::Base

  validates :src_issue_id, :name, :description, presence: true



  belongs_to :poll
  has_many :votes
end
