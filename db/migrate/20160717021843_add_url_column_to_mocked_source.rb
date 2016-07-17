class AddUrlColumnToMockedSource < ActiveRecord::Migration
  def change
    add_column :mocked_sources, :url, :string
  end
end
