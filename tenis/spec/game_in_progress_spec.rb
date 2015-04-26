require 'rspec'
require_relative '../model/game_states.rb'
require_relative '../model/player.rb'
require_relative '../model/score_board.rb'

describe 'Testing GameInProgress' do

	before(:each) do
		@mock_player1 = double(Player)
		@mock_player2 = double(Player)
		@game_state = GameInProgress.new @mock_player1, @mock_player2
	end

	it 'Should invoke count_point_for method, delegating on the argument' do
		expect(@mock_player1).to receive(:add_point_to_current_game)
		allow(@mock_player1).to receive(:current_game) { 0 }
		allow(@mock_player1).to receive(:games) { 0 }
		@game_state.count_point_for @mock_player1
	end

	it 'when player point is equal to 30, a new game point is given to the player.' do
		allow(@mock_player1).to receive(:current_game) { 30 }
		allow(@mock_player1).to receive(:games) { 0 }
		expect(@mock_player1).to receive(:add_point_to_current_game)
		@game_state.count_point_for @mock_player1
	end

	it 'when player is equal to 30 but is the last game of the set, a new set point is given to the player' do
		allow(@mock_player1).to receive(:current_game) { 30 }
		allow(@mock_player1).to receive(:games) { 5 }
		expect(@mock_player1).to receive(:add_point_to_current_game)
		@game_state.count_point_for @mock_player1
	end

end
