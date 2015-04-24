require 'rspec'
require_relative '../model/score_board.rb'

describe 'ScoreBoard' do

	before(:each) do
		@score_board = ScoreBoard.new
	end

	describe 'Scoring points' do

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

	describe 'Winning a game' do

		it 'A player wins a game, scoring 4 points in a row.' do
			4.times { @score_board.point_for_player1 }
			expect(@score_board.current_game_score).to eq("0-0")
			expect(@score_board.games_score).to eq("1-0")
		end


		it 'A player wins a game, scoring 5 points in a row.' do
			5.times { @score_board.point_for_player1 }
			expect(@score_board.current_game_score).to eq("15-0")
			expect(@score_board.games_score).to eq("1-0")
		end
	end
end
