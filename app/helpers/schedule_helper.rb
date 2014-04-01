require 'time'
module ScheduleHelper
  def get_time(schedule)
    @time = Time.new(2000,1,1,schedule.start_hour, schedule.start_minute)
  end
end
