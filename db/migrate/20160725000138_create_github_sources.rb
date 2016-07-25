class CreateGithubSources < ActiveRecord::Migration
  def change
    create_table :github_sources do |t|
      t.string :repo_url
      t.boolean :include_pull_request

      t.timestamps null: false
    end
  end
end
