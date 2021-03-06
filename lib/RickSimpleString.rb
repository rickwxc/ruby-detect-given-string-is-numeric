module RickSimpleString
	class NumberValidator 
		def self.is_valid_numeric?(string)
			string = string.to_s

			if string == ''
				return false
			end

			matches = string.match(/^((\+|-)?\d*\.?\d+)([eE](\+|-){1}\d+)?$/)
			if !matches
				return false
			end

			return true
		end
	end
end
