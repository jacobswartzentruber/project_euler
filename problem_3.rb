#The prime factors of 13195 are 5, 7, 13 and 29.
#What is the largest prime factor of the number 600851475143 ?

def prime_factorization(num)
	# Initialize an array to hold all prime factors
	factors = Array.new

	# Start the divisor at 2 because it is the first prime number
	divisor = 2

	# Iterate and increment divisors by one
	while num > 1
		# If number divides by divisor, add divisor to factors
		# This works because if it wasn't divisible by 2 it wouldn't
		# be divisible by 4.  Only takes primes into account
		while num%divisor == 0
			factors.push(divisor)
			num /= divisor
		end
		divisor += 1
	end
	# Return factor array
	factors
end

puts prime_factorization(600851475143)
puts prime_factorization(600851475143).max
# returns 6857