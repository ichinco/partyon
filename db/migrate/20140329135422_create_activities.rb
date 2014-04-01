class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :website
      t.integer :cost
      t.string :activity_type

      t.timestamps
    end
  end
end
