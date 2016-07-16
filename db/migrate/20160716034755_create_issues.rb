class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.string :description
      t.integer :src_issue_id
      t.references :poll, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
