FactoryBot.define do
  factory :leaderboard_entry do
    sequence(:username) { |n| "username#{n}" }
    score { 10 }
  end
end
