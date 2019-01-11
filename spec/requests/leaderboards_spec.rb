require 'rails_helper'

RSpec.describe "Leaderboards", type: :request do
  describe "GET /leaderboards" do
    it "works! (now write some real specs)" do
      get leaderboards_path
      expect(response).to have_http_status(200)
    end
  end
end
