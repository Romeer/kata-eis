class AbstractGameStatus

	def initialize player1, player2
		@player1 = player1
		@player2 = player2
	end

	def count_point_for player
		if player.current_game < 40
			player.add_point_to_current_game
		else
			self.trigger_state_action player
		end
	end


	def game_status
		"The game is still in course! The set scores are:"
	end

	def is_current_status? 
		raise NotImplementedError.new
	end

	def set_point
		[@player1,@player2].map { |p| p.games}.max == 5
	end

	def not_equal_points
		(@player1.current_game != @player2.current_game )
	end

	def is_game_point
		[@player1,@player2].map { | p | p.current_game }.max == 40 
	end

end

class GameInProgress < AbstractGameStatus

	def count_point_for player
		player.add_point_to_current_game
	end

	def is_current_status?
		[@player1,@player2].map { | p | p.current_game }.max <= 30 
	end
end

class GamePoint < AbstractGameStatus

	def trigger_state_action player
		@player1.reset_game_points
		@player2.reset_game_points
		player.add_point_to_games
	end

	def is_current_status? 
		(not self.set_point) && self.not_equal_points && self.is_game_point
	end

end

class SetPoint < AbstractGameStatus

	def trigger_state_action player
		player.add_point_to_sets
		@player1.reset_game_points
		@player2.reset_game_points
		@player1.reset_games_points
		@player2.reset_games_points
	end

	def is_current_status?
		self.is_game_point && self.not_equal_points && self.set_point
	end

end

class EndedGame < AbstractGameStatus

	def count_point_for player
		raise NotImplementedError.new
	end

	def game_status
		"The game has ended! The result was:"
	end

	def is_current_status?
		[@player1, @player2].map { |p| p.sets }.max == 2
	end
end