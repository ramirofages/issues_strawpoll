class ChangeDurationColumnToPolls < ActiveRecord::Migration
  def change
  	change_column :polls, :duration, :date
  end
end
