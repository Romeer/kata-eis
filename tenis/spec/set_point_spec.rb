require 'rspec'
require_relative '../model/game_states.rb'
require_relative '../model/player.rb'
require_relative '../model/score_board.rb'

describe 'Testing SetPoint' do

	before(:each) do
		@mock_player1 = double(Player)
		@mock_player2 = double(Player)
		@game_state = SetPoint.new @mock_player1, @mock_player2
	end

	it 'After winning a point, the leading player gets a set point.' do
		expect(@mock_player1).to receive(:current_game) { 40 }
		expect(@mock_player1).to receive(:add_point_to_sets)
		expect(@mock_player1).to receive(:reset_game_points)
		expect(@mock_player1).to receive(:reset_games_points)
		expect(@mock_player2).to receive(:reset_game_points)
		expect(@mock_player2).to receive(:reset_games_points)
		@game_state.count_point_for @mock_player1
	end

end