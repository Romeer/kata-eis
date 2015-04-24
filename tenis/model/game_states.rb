class AbstractGameStatus

	def count_point_for marcador, numero_jugador
		raise NotImplementedError.new
	end

end

class GameInProgress < AbstractGameStatus

	def count_point_for player
		player.add_point_to_current_game
	end
end