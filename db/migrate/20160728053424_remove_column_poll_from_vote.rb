class RemoveColumnPollFromVote < ActiveRecord::Migration
  def change
  	remove_column :votes, :poll_id, :integer
  end
end
