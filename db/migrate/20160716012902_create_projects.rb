class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :public
      t.string :description
      t.references :project_source, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
