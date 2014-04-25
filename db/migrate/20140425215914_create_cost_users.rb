class CreateCostUsers < ActiveRecord::Migration
  def change
    create_table :cost_users do |t|
      t.references :cost, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
