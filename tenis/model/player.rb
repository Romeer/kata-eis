
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
			@current_game += 10
		end
	end

	def add_point_to_games
		@games += 1
	end

	def add_point_to_sets
		@sets += 1
	end

	def reset_game_points
		@current_game = 0
	end
end
