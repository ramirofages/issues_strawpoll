class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
			t.string :name
      t.string :description
      t.datetime :duration
      t.references :project, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
