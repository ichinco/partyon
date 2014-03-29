class AddColumnToSchedule < ActiveRecord::Migration
  def change
    add_reference :schedules, :trip, index: true
  end
end
