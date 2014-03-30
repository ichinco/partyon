class CreateTripUsers < ActiveRecord::Migration
  def change
    create_table :trip_users do |t|
      t.references :trip, index: true
      t.references :user, index: true
      t.string :role

      t.timestamps
    end
  end
end
