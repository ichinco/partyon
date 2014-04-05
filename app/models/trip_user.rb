class TripUser < ActiveRecord::Base
  belongs_to :trip
  belongs_to :user

  accepts_nested_attributes_for :user
end
