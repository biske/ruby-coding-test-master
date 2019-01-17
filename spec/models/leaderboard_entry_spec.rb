require 'rails_helper'

RSpec.describe LeaderboardEntry, type: :model do
  let(:leaderboard) { create(:leaderboard) }

  describe 'validations' do
    subject { build(:leaderboard_entry, leaderboard: leaderboard, username: username, score: score) }
    let(:username) { 'foobar' }
    let(:score) { 10 }

    it { is_expected.to be_valid }

    context 'when username is missing' do
      let(:username) { nil }
      it { is_expected.to be_invalid }
    end

    context 'when score is missing' do
      let(:score) { nil }
      it { is_expected.to be_invalid }
    end
  end
end
