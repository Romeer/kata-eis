
class Board

	def initialize xcoord, ycoord
		@inner_rep = Array.new(xcoord) {Array.new(ycoord)}
	end

	def create_ship ship, xcoord, ycoord
		@inner_rep[xcoord][ycoord] = ship
	end
	
	def is_occupied? xcoord, ycoord
		@inner_rep[xcoord][ycoord].occupied?
	end
end