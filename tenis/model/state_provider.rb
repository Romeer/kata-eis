require_relative '../model/game_states.rb'
require_relative '../model/score_board.rb'
include ObjectSpace

class StateProvider

	def initialize player1, player2
		@player1 = player1
		@player2 = player2
	end

	def get_state
		self.descendants(AbstractGameStatus).detect { |klass| klass.send(:is_current_status?) }
	end

	protected
		def descendants parent
			ObjectSpace.each_object(Class).select { |klass| klass < parent }
												.map { |klass| klass.new @player1, @player2}
		end
end