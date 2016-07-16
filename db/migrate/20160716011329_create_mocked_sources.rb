class CreateMockedSources < ActiveRecord::Migration
  def change
    create_table :mocked_sources do |t|

      t.timestamps null: false
    end
  end
end
