class AddTripToCostUser < ActiveRecord::Migration
  def change
    add_reference :cost_users, :trip, index: true
  end
end
