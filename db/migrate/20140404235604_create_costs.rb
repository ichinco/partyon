class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.references :activity, index: true
      t.integer :estimated_amount
      t.integer :actual_amount

      t.timestamps
    end
  end
end
