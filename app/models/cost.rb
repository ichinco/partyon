class Cost < ActiveRecord::Base
  belongs_to :activity
  belongs_to :trip
end
