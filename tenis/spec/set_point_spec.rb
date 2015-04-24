require 'rspec'
require_relative '../model/game_states.rb'
require_relative '../model/player.rb'
require_relative '../model/score_board.rb'

describe 'Testing SetPoint' do

	before(:each) do
		@mock_player = double(Player)
		@mock_score_board = double(ScoreBoard)
		@game_state = SetPoint.new @mock_score_board
	end

	it 'After winning a point, the leading player gets a set point.' do
		expect(@mock_player).to receive(:add_point_to_sets)
		expect(@mock_player).to receive(:reset_game_points)
		expect(@mock_player).to receive(:reset_games_points)
		expect(@mock_score_board).to receive(:game_in_progress)
		@game_state.count_point_for @mock_player
	end

end