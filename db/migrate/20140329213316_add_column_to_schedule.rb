class AddColumnToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :trip, :reference
  end
end
