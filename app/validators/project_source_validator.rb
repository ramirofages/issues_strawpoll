class ProjectSourceValidator < ActiveModel::Validator
  def validate(record)
  	record.errors[:base] << "Project already has a source" unless record.project.project_source_id_was.nil?
  end
end