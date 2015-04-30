require_relative './ships.rb'

class Board

	def initialize xcoord, ycoord
		@inner_rep = Array.new(xcoord) {Array.new(ycoord)}
	end

	def create_small_ship xcoord, ycoord
		@inner_rep[xcoord][ycoord] = SmallShip.new
	end

	def create_large_ship xcoord, ycoord
		(ycoord..ycoord+1).map { |y| @inner_rep[xcoord][y] = LargeShip.new }
	end

	def is_occupied? xcoord, ycoord
		@inner_rep[xcoord][ycoord].occupied?
	end

end