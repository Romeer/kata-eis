class AbstractGameStatus

	def initialize score_board	
		@score_board = score_board
	end

	def count_point_for player
		raise NotImplementedError.new
	end

	def game_status
		"The game is still in course! The set scores are:"
	end

	def is_current_status? player1, player2
		#raise NotImplementedError.new
		false
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

	def is_current_status? player1, player2
		[player1,player2].map { | p | p.current_game }.max < 40 
	end
end

class GamePoint < AbstractGameStatus

	def count_point_for player
		@score_board.clean_game_points
		player.add_point_to_games
		@score_board.game_in_progress
	end
end

class SetPoint < AbstractGameStatus

	def count_point_for player
		player.add_point_to_sets
		@score_board.clean_game_points
		@score_board.clean_games
		case player.sets
		when 0,1
			@score_board.game_in_progress
		else
			@score_board.ended_game
		end
	end
end

class EndedGame < AbstractGameStatus

	def game_status
		"The game has ended! The result was:"
	end
end