class PollVote < ActiveRecord::Base
  belongs_to :poll_choise
  belongs_to :user
  belongs_to :poll
end
