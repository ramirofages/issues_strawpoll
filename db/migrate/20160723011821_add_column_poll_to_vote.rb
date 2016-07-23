class AddColumnPollToVote < ActiveRecord::Migration
  def change
    add_reference :votes, :poll, index: true, foreign_key: true
  end
end
