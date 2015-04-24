require 'rspec'
require_relative '../model/score_board.rb'

describe 'ScoreBoard' do

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


		it 'If a player makes a point, score turns to 0-15' do
			@score_board.point_for_player2
			expect(@score_board.current_game_score).to eq("0-15")
		end

		it 'If a player makes 3 points, points return to 0' do
			3.times { @score_board.point_for_player1 }
			expect(@score_board.current_game_score).to eq ("40-0")
		end
	end
end
