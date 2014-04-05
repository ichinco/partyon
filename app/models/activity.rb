class Activity < ActiveRecord::Base
  has_many :costs
  has_many :schedules

  accepts_nested_attributes_for :costs
  accepts_nested_attributes_for :schedules
end
