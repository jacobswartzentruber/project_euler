#The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.
#Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:
#d2d3d4=406 is divisible by 2
#d3d4d5=063 is divisible by 3
#d4d5d6=635 is divisible by 5
#d5d6d7=357 is divisible by 7
#d6d7d8=572 is divisible by 11
#d7d8d9=728 is divisible by 13
#d8d9d10=289 is divisible by 17
#Find the sum of all 0 to 9 pandigital numbers with this property.

def pandigital_divisors
	@pandigitals = []
	divisors = [2,3,5,7,11,13,17]

	# Recursion function that creates pandigital numbers
	def get_pan(number, available_digits)
		# If available numbers left, add digit and call function with remaining digits
		if available_digits.length > 1
			available_digits.each_char do |x|
				get_pan(number+x,available_digits.delete(x))
			end
		else
			# If last digit, push pandigital to pandigital array
			@pandigitals << (number+available_digits)
		end
	end

	# Find all pandigitals 0 to 9
	get_pan("","0123456789")
	puts "Got Pandigitals, now calculating divisors..."

	# Check pandigitals for sub-string divisors
	sum = 0
	@pandigitals.each do |pan|
		answer = true
		# Check substrings if they are divisible by appropriate divisor. If all divide appropriately, add to sum
		divisors.each_with_index do |d, i|
			unless pan[i+1..i+3].to_i%d == 0
				answer = false
				break
			end
		end
		sum += pan.to_i if answer
	end
	puts sum
end

pandigital_divisors
# Returns 16695334890
# Function take awhile to run due to brute force solution