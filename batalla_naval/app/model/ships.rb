
class AbstractShip

  def occupied?
    true
  end

  def shoot
    raise NotImplementedError.new
  end

  def fits? xFreeSpace, yFreeSpace
    raise NotImplementedError.new
  end

end

class SmallShip < AbstractShip

  def shoot
    "Sink"
  end

  def fits? xFreeSpace, yFreeSpace
    (xFreeSpace > 0) & (yFreeSpace > 0 )
  end
end

class LargeShip < AbstractShip

  @has_been_hitted = false

  def shoot
    if @has_been_hitted
      "Sink"
    else
      @has_been_hitted = true
      "Hit"
    end
  end

  def fits? xFreeSpace, yFreeSpace
    (yFreeSpace > 1) & (xFreeSpace > 0)
  end
end

class NullShip < AbstractShip

  def occupied?
    false
  end

  def shoot
    "Miss"
  end
end
