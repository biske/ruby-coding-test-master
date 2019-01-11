class Leaderboard < ApplicationRecord
  has_many :entries, class_name: 'LeaderboardEntry'
end
