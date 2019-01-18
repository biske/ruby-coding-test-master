require 'rails_helper'

describe CalculatePosition do
  describe '.run' do
    let(:leaderboard) { create(:leaderboard) }
    let!(:leaderboard_entry1) { create(:leaderboard_entry, leaderboard: leaderboard, score: 1) }
    let!(:leaderboard_entry2) { create(:leaderboard_entry, leaderboard: leaderboard, score: 5) }

    context 'when the score for given username exists' do
      it 'returns position' do
        position = CalculatePosition.run(leaderboard: leaderboard, username: leaderboard_entry1.username)
        expect(position).to eq 2
      end
    end

    context 'when the score for given username does not exist' do
      it 'returns nil' do
        position = CalculatePosition.run(leaderboard: leaderboard, username: 'foobar')
        expect(position).to eq nil
      end
    end
  end
end