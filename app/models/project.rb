class Project < ActiveRecord::Base
  belongs_to :project_source, polymorphic: true, dependent: :destroy
  belongs_to :user
end
