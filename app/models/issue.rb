class Issue < ActiveRecord::Base

  validates :poll, :src_issue_id, :name, :description, presence: true



  belongs_to :poll, inverse_of: :issues
  has_many :votes
end
