class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.references :trip, index: true
      t.string :question
      t.text :description

      t.timestamps
    end
  end
end
