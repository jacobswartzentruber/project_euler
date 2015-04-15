#145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#Find the sum of all numbers which are equal to the sum of the factorial of their digits.
#Note: as 1! = 1 and 2! = 2 are not sums they are not included.

def digit_factorials
	answer = 0
	# Find upper bound for calculations. Since 9!*7 has seven digits and 9!*8 has seven digits, we use 9!*7
	limit = (1..9).inject(:*)*7
	(10..limit).each do |x|
		puts x
		sum = 0
		number = x
		# Cycle through all digits of the number
		while number > 0
			# Add factorial of digit to sum unless digit is 0, then add 1 because 0! is 1
			number%10 == 0 ? sum += 1 : sum += (1..number%10).inject(:*) 
			number /= 10
		end
		# Add sum to answer if sum is equal to number
		answer += sum if sum == x
	end
	puts answer
end

digit_factorials
# Returns 40730
# As this is a brute force solution it took a long time.  Unsure how to optimize further but it works.