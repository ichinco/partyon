class Cost < ActiveRecord::Base
  belongs_to :activity
  belongs_to :trip
  belongs_to :user

  has_many :cost_users

  validates :estimated_amount, :numericality => true, :allow_blank => true
  validates :actual_amount, :numericality => true, :allow_blank => true
end
