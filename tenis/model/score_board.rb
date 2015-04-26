require_relative './game_states.rb'
require_relative './player.rb'
require_relative './state_provider.rb'

class ScoreBoard

	def initialize
		@player1 = Player.new
		@player2 = Player.new
		@state_provider = StateProvider.new @player1, @player2
		@game_state = @state_provider.get_state
	end

	def point_for_player1
		@game_state.count_point_for @player1
		self.change_state_if_necessary
	end

	def point_for_player2
		@game_state.count_point_for @player2
		self.change_state_if_necessary
	end

	def current_game_score
		"#{@player1.current_game}-#{@player2.current_game}"
	end

	def games_score
		"#{@player1.games}-#{@player2.games}"
	end

	def sets_score
		"#{@player1.sets}-#{@player2.sets}"
	end

	def game_result
		"#{@game_state.game_status} #{[@player1.sets,@player2.sets].max}"
	end

	protected

		def change_state_if_necessary
			@game_state = @state_provider.get_state unless @game_state.is_current_status?
		end
end