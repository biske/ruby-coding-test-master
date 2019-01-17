class MakeUsernameAndScoreNotNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:leaderboard_entries, :username, false)
    change_column_null(:leaderboard_entries, :score, false, 0)
  end
end
