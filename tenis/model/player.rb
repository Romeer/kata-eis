
class Player

	def initialize
		@sets = 0
		@games = 0
		@current_game = 0
	end

	attr_reader :sets, :games, :current_game

	def add_point_to_current_game
		case @current_game
		when 0, 15
			@current_game += 15
		when 30
			@current_game += 40
		else
			@current_game = 0
		end
	end
end
