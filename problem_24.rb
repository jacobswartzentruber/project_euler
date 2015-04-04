#A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
#If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
#012   021   102   120   201   210
#What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

def lex_permutation(numbers, index)
	@permutations = []

	def make_per(available, final)
		if available.length == 1
			final += available
			@permutations << final
		else
			available.each_char do |x|
				tempA = available.delete x			
				make_per(tempA, final+x)
			end
		end
	end

	# Find all permutations, automatically sorted numerically
	make_per(numbers, "")

	puts @permutations[index]
end

lex_permutation("0123456789", 999999)
# Returns 2783915460