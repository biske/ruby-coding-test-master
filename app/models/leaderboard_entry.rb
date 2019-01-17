class LeaderboardEntry < ApplicationRecord
  belongs_to :leaderboard

  validates :username, presence: true
  validates :score, presence: true
end
