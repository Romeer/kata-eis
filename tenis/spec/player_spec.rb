require 'rspec'
require_relative '../model/player.rb'

describe 'Player' do

	describe 'Counting points for current game' do

		before(:each) do
			@player = Player.new
		end

		it 'Counting a point, turn current game points into 15' do
			@player.add_point_to_current_game
			expect(@player.current_game).to eq(15)
		end

		it 'Counting 4 points, turn current game points into 0' do
			4.times { @player.add_point_to_current_game }
			expect(@player.current_game).to eq(0)
		end

	end

end