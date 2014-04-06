class PollChoise < ActiveRecord::Base
  belongs_to :poll

  has_many :poll_votes
end
