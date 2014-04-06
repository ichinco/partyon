class AddPollToVote < ActiveRecord::Migration
  def change
    add_reference :poll_votes, :poll, index: true
  end
end
