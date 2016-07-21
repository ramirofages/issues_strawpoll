class Project < ActiveRecord::Base
  belongs_to :project_source, polymorphic: true, dependent: :destroy
  belongs_to :user
  has_many :polls, dependent: :destroy

  def is_private?
  	!public
  end
end
