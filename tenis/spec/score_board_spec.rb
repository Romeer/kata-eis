require 'rspec'
require_relative '../model/score_board.rb'

describe 'Marcador' do

	describe 'Scoring points' do

		before(:each) do
			@score_board = ScoreBoard.new
		end

		it 'If a player makes a point, score turns to 15-0' do
			@score_board.point_for_player1
			expect(@score_board.current_game_score).to eq("15-0")
		end

		it 'If a player makes a point, score turns to 30-0' do
			@score_board.point_for_player1
			@score_board.point_for_player1
			expect(@score_board.current_game_score).to eq("30-0")
		end

	end
end
