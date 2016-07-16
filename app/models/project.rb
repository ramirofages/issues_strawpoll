class Project < ActiveRecord::Base
  belongs_to :project_source, polymorphic: true
end
