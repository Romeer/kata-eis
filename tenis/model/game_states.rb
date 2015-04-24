class AbstractGameStatus

	def initialize score_board
		@score_board = score_board
	end

	def count_point_for player
		raise NotImplementedError.new
	end

end

class GameInProgress < AbstractGameStatus

	def count_point_for player
		@score_board.game_point unless not self.last_game_point? player
		@score_board.set_point unless not self.last_game_of_the_set? player
		player.add_point_to_current_game
	end

	def last_game_point? player
		player.current_game == 30
	end

	def last_game_of_the_set? player
		(player.games == 5) and (self.last_game_point? player)
	end
end

class GamePoint < AbstractGameStatus

	def count_point_for player
		player.reset_game_points
		player.add_point_to_games
		@score_board.game_in_progress
	end
end

class SetPoint < AbstractGameStatus

	def count_point_for player
		player.add_point_to_sets
		player.reset_game_points
		player.reset_games_points
		@score_board.game_in_progress
	end
end