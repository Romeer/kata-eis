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

		it 'Counting 3 points, turn current game points into 40' do
			3.times { @player.add_point_to_current_game }
			expect(@player.current_game).to eq(40)
		end

	end

	describe 'Counting games count after winning current game' do

		it 'After winning a game, games count should be 1' do
			@player.add_point_to_games
			expect(@player.games).to eq(1)
		end

		it 'After winning the fifthth game, games count is 5' do
			5.times { @player.add_point_to_games }
			expect(@player.games).to eq (5)
		end
	end

	describe 'Counting sets.' do

		it 'After winning a set, set count should be 1' do
			@player.add_point_to_sets
			expect(@player.sets).to eq(1)
		end
	end
end