class AddTripToCost < ActiveRecord::Migration
  def change
    add_reference :costs, :trip, index: true
  end
end
