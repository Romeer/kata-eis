
class Player

	def initialize
		@sets = 0
		@games = 0
		@current_game = 0
	end

	attr_reader :sets, :games, :current_game

	def add_point_to_current_game
		unless @current_game == 40
			@current_game += 15
		else
			@current_game = 0
		end
	end
end
