class CalculatePosition
  def self.run(leaderboard:, username:)
    @rankings = leaderboard
      .entries
      .group(:username)
      .order('sum_score DESC')
      .sum(:score)

    index = @rankings.keys.index(username)

    position = index ? index + 1 : nil
  end
end