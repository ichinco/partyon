class CreatePollVotes < ActiveRecord::Migration
  def change
    create_table :poll_votes do |t|
      t.references :poll_choise, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
