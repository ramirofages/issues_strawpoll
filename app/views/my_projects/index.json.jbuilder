json.array!(@projects) do |project|
  json.extract! project, :id, :name, :public, :description, :project_source_id
  json.url project_url(project, format: :json)
end
