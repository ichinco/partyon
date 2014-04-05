class Schedule < ActiveRecord::Base
  belongs_to :activity

  validates :day, :presence => true
  validates :start_time, :presence => true
end
