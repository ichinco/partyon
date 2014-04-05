class AddStartTimeToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :start_time, :time
    remove_column :schedules, :start_hour
    remove_column :schedules, :start_minute
  end
end
