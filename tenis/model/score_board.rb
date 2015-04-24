require_relative './game_states.rb'
require_relative './player.rb'

class ScoreBoard

	def initialize
		@player1 = Player.new
		@player2 = Player.new
		@game_state = GameInProgress.new 
	end

	def point_for_player1
		@game_state.count_point_for @player1
	end

	def current_game_score
		"#{@player1.current_game}-#{@player2.current_game}"
	end


end