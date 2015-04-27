#It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
#9 = 7 + 2×12
#15 = 7 + 2×22
#21 = 3 + 2×32
#25 = 7 + 2×32
#27 = 19 + 2×22
#33 = 31 + 2×12
#It turns out that the conjecture was false.
#What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?

# Method to check if a number is prime
def is_prime?(num)
	# Check if num divisible by 2
  return false if num % 2 == 0 && num > 2
  # Otherwise check odd numbers
  (3..Math.sqrt(num)).step(2).each do |n|
  	return false if num%n == 0
  end
  return true;
end

def goldbach_conjecture
	number = 3
	answer = false

	until answer
		number += 1
		# Make sure number to test is composite and odd
		unless is_prime?(number) || number%2 == 0
			answer = true
			# Cycle through 2*squares until result over number
			n = 1
			while (n**2)*2 < number
				# Check to see if remainder is prime, if so set answer to false so loop continues to next number
				# If all n-remainders are composite, program has found answer
				if is_prime?(number-(n**2)*2)
					answer = false
					break
				end
				n += 1
			end
		end
	end
	puts number
end

goldbach_conjecture
# Returns 5777