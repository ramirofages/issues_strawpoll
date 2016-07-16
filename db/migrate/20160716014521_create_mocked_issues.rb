class CreateMockedIssues < ActiveRecord::Migration
  def change
    create_table :mocked_issues do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
