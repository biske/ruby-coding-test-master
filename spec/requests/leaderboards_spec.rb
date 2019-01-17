require 'rails_helper'

RSpec.describe "Leaderboards", type: :request do
  describe "GET /leaderboards" do
    it "works! (now write some real specs)" do
      get leaderboards_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /leaderboards/:id' do
    let!(:leaderboard) { create(:leaderboard) }
    let!(:leaderboard_entry) { create(:leaderboard_entry, leaderboard: leaderboard) }

    it 'responds with status 200' do
      get leaderboard_path(leaderboard)
      expect(response).to have_http_status(200)
    end
  end
end
