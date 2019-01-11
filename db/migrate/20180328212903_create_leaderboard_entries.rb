class CreateLeaderboardEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :leaderboard_entries do |t|
      t.references :leaderboard, foreign_key: true
      t.string :username
      t.integer :score

      t.timestamps
    end
  end
end
