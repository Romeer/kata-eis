require 'rspec'
require_relative '../model/score_board.rb'

describe 'Marcador' do

	describe 'Incremento de puntos, games, sets' do

		before(:each) do
			@score_board = ScoreBoard.new
		end

		it 'If a player makes a point, score turns to 15-0' do
			@score_board.point_for_player1
			expect(@score_board.current_game_score).to eq("15-0")
		end
	end
end
