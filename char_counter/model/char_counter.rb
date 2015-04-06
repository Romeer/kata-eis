
class CharCounter

	class << self
		
		def count string
			ret_hash = Hash.new
			if not string.nil?
				fixed_string = string.split(%r{\s*})
				letters = fixed_string.uniq
				letters.map { |letter| ret_hash[letter] = fixed_string.count(letter) }
			end
			ret_hash
		end

	end

end