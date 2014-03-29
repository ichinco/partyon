class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :activity, index: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end

def change
  add_column :schedules, :day, :integer,
  add_column :schedules, :start_hour, :integer,
  add_column :schedules, :start_minute, :integer,
  add_column :schedules, :duration, :integer,
  remove_column :schedules, :start_time,
  remove_column :schedules, :end_time
end
