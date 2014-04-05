class Activity < ActiveRecord::Base
  has_many :costs
  has_many :schedules

  validates :name, presence: true
  validates :location, presence: true

  accepts_nested_attributes_for :costs, reject_if: :estimated_cost_blank
  accepts_nested_attributes_for :schedules, reject_if: :day_start_time_blank

  def estimated_cost_blank(a)
    a[:estimated_cost].blank?
  end

  def day_start_time_blank(a)
    a[:day].blank? or a[:start_time].blank?
  end
end
