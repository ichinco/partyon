class CreatePollChoises < ActiveRecord::Migration
  def change
    create_table :poll_choises do |t|
      t.references :poll, index: true
      t.text :description

      t.timestamps
    end
  end
end
