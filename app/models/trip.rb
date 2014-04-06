class Trip < ActiveRecord::Base
  has_many :trip_users
end
