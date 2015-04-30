
class AbstractShip

	def occupied?
		true
	end

	def shoot
		raise NotImplementedError.new
	end

end

class SmallShip < AbstractShip

	def shoot
		"Sink"
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
end

class NullShip < AbstractShip

	def occupied?
		false
	end

	def shoot
		"Miss"
	end
end