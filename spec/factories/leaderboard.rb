FactoryBot.define do
  factory :leaderboard do
    sequence(:name) { |n| "Leaderboard #{n}" }
  end
end
