class RenameDurationColumnFromPolls < ActiveRecord::Migration
  def change
  	rename_column :polls, :duration, :expiration_date
  end
end
