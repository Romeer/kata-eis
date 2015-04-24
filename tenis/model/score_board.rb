require_relative './game_states.rb'
require_relative './player.rb'

class ScoreBoard

	def initialize
		@player1 = Player.new
		@player2 = Player.new
		@game_state = GameInProgress.new self
	end

	def point_for_player1
		@game_state.count_point_for @player1
	end

	def point_for_player2
		@game_state.count_point_for @player2
	end

	def current_game_score
		"#{@player1.current_game}-#{@player2.current_game}"
	end

	def last_game_point
		@game_state = GamePoint.new self
	end

	def game_in_progress
		@game_state = GameInProgress.new self
	end

end