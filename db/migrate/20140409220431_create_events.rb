class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, index: true
      t.references :trip, index: true
      t.text :message

      t.timestamps
    end
  end
end
