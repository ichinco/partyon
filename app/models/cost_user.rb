class CostUser < ActiveRecord::Base
  belongs_to :cost
  belongs_to :user
end
