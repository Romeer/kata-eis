require_relative './ships.rb'

class Board

  def initialize xcoord, ycoord
    @inner_rep = Array.new(xcoord) {Array.new(ycoord) { NullShip.new } }
  end

  def create_small_ship xcoord, ycoord
    small_ship = SmallShip.new
    sanitize_input(small_ship, xcoord, ycoord)
    @inner_rep[xcoord][ycoord] = small_ship
  end

  def create_large_ship xcoord, ycoord
    large_ship = LargeShip.new
    sanitize_input(large_ship, xcoord, ycoord)
    raise 'Already occupied' if self.is_occupied? xcoord, ycoord+1
    (ycoord..ycoord+1).map { |y| @inner_rep[xcoord][y] = large_ship }
  end

  def shoot xcoord, ycoord
    @inner_rep[xcoord][ycoord].shoot
  end

  def eval_damages xcoord, ycoord
    @inner_rep[xcoord][ycoord].get_damages
  end

  def is_occupied? xcoord, ycoord
    @inner_rep[xcoord][ycoord].occupied?
  end

  protected
  def sanitize_input ship, xcoord, ycoord
    xFreeSpace = @inner_rep.length - xcoord
    yFreeSpace = @inner_rep[0].length - ycoord
    raise "Out of bounds" unless ship.fits?(xFreeSpace,yFreeSpace)
    raise 'Already occupied' if self.is_occupied? xcoord, ycoord
  end

end
