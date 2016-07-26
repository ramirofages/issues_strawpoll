class ProjectHasSourceValidator < ActiveModel::Validator
  def validate(record)
  	record.errors[:base] << "Project has no source" unless not record.project.project_source.nil?
  end
end