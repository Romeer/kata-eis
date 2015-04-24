require 'rspec'
require_relative '../model/player.rb'

describe 'Player' do

	before(:each) do
		@player = Player.new
	end

	describe 'Counting points for current game' do

		it 'Counting a point, turn current game points into 15' do
			@player.add_point_to_current_game
			expect(@player.current_game).to eq(15)
		end

		it 'Counting 4 points, turn current game points into 0' do
			4.times { @player.add_point_to_current_game }
			expect(@player.current_game).to eq(0)
		end

	end

	describe 'Counting games count after winning current game' do

		it 'After winning a game, games count should be 1' do
			@player.add_point_to_games
			expect(@player.games).to eq(1)
		end

		it 'After winning the sixth game, games count is 0' do
			6.times { @player.add_point_to_games }
			expect(@player.games).to eq (0)
		end

	end

end