class AddColumnsToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :day, :integer
    add_column :schedules, :duration, :integer
    add_column :schedules, :start_hour, :integer
    add_column :schedules, :start_minute, :integer
    remove_column :schedules, :start_time
    remove_column :schedules, :end_time
  end
end
