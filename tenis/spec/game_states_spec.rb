require 'rspec'
require_relative '../model/game_states.rb'
require_relative '../model/player.rb'

describe 'Testing GameInProgress' do

	it 'Should invoke count_point_for method, delegating on the argument' do
		mock_player = double(Player)
		game_state = GameInProgress.new
		expect(mock_player).to receive(:add_point_to_current_game)
		game_state.count_point_for mock_player
	end

end