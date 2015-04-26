require 'rspec'
require_relative '../model/state_provider.rb'
require_relative '../model/game_states.rb'
require_relative '../model/score_board.rb'

describe 'StateProvider' do

	before(:each) do
		@mock_player1 = double(Player)
		@mock_player2 = double(Player)
		@mock_score = double(ScoreBoard)
		@state_provider = StateProvider.new @mock_player1, @mock_player2
	end

	it 'Should return GameInProgress state.' do
		allow(@mock_player1).to receive(:current_game) { 0 }
		allow(@mock_player2).to receive(:current_game) { 0 }
		allow(@mock_player1).to receive(:games) { 0 }
		allow(@mock_player2).to receive(:games) { 0 }
		allow(@mock_player1).to receive(:sets) { 0 }
		allow(@mock_player2).to receive(:sets) { 0 }
		expect(@state_provider.get_state).to be_an_instance_of(GameInProgress)
	end

	it 'Should return GamePoint state.' do
		allow(@mock_player1).to receive(:current_game) { 40 }
		allow(@mock_player2).to receive(:current_game) { 0 }
		allow(@mock_player1).to receive(:games) { 0 }
		allow(@mock_player2).to receive(:games) { 0 }
		allow(@mock_player1).to receive(:sets) { 0 }
		allow(@mock_player2).to receive(:sets) { 0 }
		expect(@state_provider.get_state).to be_an_instance_of(GamePoint)
	end

	it 'Should return SetPoint state.' do
		allow(@mock_player1).to receive(:current_game) { 40 }
		allow(@mock_player2).to receive(:current_game) { 0 }
		allow(@mock_player1).to receive(:games) { 5 }
		allow(@mock_player2).to receive(:games) { 0 }
		allow(@mock_player1).to receive(:sets) { 0 }
		allow(@mock_player2).to receive(:sets) { 0 }
		expect(@state_provider.get_state).to be_an_instance_of(SetPoint)
	end

	it 'Should return EndedGame state.' do
		allow(@mock_player1).to receive(:current_game) { 0 }
		allow(@mock_player2).to receive(:current_game) { 0 }
		allow(@mock_player1).to receive(:games) { 0 }
		allow(@mock_player2).to receive(:games) { 0 }
		allow(@mock_player1).to receive(:sets) { 2 }
		allow(@mock_player2).to receive(:sets) { 0 }
		expect(@state_provider.get_state).to be_an_instance_of(EndedGame)
	end

end