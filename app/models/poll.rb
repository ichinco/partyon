class Poll < ActiveRecord::Base
  belongs_to :trip

  has_many :poll_choises

  accepts_nested_attributes_for :poll_choises, :reject_if => lambda { |a| a[:description].blank? }
end
