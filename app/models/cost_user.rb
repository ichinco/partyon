class CostUser < ActiveRecord::Base
  belongs_to :cost
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => :cost_id
end
