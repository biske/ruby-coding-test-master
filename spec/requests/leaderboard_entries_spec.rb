require 'rails_helper'

RSpec.describe "LeaderboardEntries", type: :request do
  describe "GET /leaderboard_entries" do
    it "works! (now write some real specs)" do
      get leaderboard_entries_path
      expect(response).to have_http_status(200)
    end
  end
end
