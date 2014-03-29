class AddColumnToSchedule < ActiveRecord::Migration
  def change
    add_reference :schedule, :trip, index: true
  end
end
