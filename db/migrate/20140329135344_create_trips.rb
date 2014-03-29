class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.integer :length
      t.string :location
      t.date :start_date

      t.timestamps
    end
  end
end
