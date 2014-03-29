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

