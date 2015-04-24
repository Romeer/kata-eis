require 'rspec'
require_relative '../model/game_states.rb'
require_relative '../model/player.rb'
require_relative '../model/score_board.rb'

describe 'Testing GamePoint' do

	before(:each) do
		@mock_player = double(Player)
		@mock_score_board = double(ScoreBoard)
		@game_state = GamePoint.new @mock_score_board
	end

	it 'When the leading player makes a point, count a game point for him and start a new game' do
		expect(@mock_player).to receive(:reset_game_points)
		expect(@mock_score_board).to receive(:game_in_progress)
		@game_state.count_point_for @mock_player
	end
end