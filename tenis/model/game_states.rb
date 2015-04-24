class AbstractGameStatus

	def initialize score_board
		@score_board = score_board
	end

	def count_point_for player
		raise NotImplementedError.new
	end

	def change_state_condition? player
		raise NotImplementedError.new
	end

end

class GameInProgress < AbstractGameStatus

	def count_point_for player
		@score_board.last_game_point unless not self.change_state_condition? player
		player.add_point_to_current_game
	end

	def change_state_condition? player
		player.current_game == 30
	end
end
