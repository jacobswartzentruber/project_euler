#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#What is the 10 001st prime number?

def sieve_eratosthenes(len)
	primes = [2]
	n = 2

	# Keep finding primes until requested length is reached
	until primes.length == len
		# Increase next number to test by one
		n += 1 

		# Test n against all numbers in prime array
		# If n is divisible by a prime, break and get next number to test
		is_prime = true
		primes.each do |p|
			if n%p == 0
				is_prime = false 
				break
			end
		end
		# If n is not divisible by previous primes, push to primes array
		primes << n if is_prime
	end
	puts primes.last
end

# Testing with lower known numbers
sieve_eratosthenes(10)
sieve_eratosthenes(20)

sieve_eratosthenes(10001)
# Returns 104743

# Not sure if my solution is the fastest way to complete this problem.
# It seems like it brute forces much of the algorithm
# There is probably some better optimization I haven't yet figured out
