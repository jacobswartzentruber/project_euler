#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#Find the sum of all the primes below two million

# A method to check if a number is prime
# Used by the sum_primes method
def is_prime?(num)
	# Check if num divisible by 2
  return false if num % 2 == 0
  # Otherwise check odd numbers
  (3..Math.sqrt(num)).step(2).each do |n|
  	return false if num%n == 0
  end
  return true;
end

# A variation on Eratosthenes sieve which checks previous primes numbers
# when determining prime status for a number
def sum_primes(num)
	sum = 2
	start = Time.now

	(3..num).each do |n|
		sum += n if is_prime?(n)
	end

	puts sum
	puts Time.now-start
end

# My first attempt at eratosthenes sieve.  Gives correct answer but incredibly
# inefficient.  Perfoms calculations for every number 3 to the given limit
def sieve_eratosthenes(len)
	total = []
	last_prime = 0
	sum = 2
	start = Time.now

	# Create array of ints for maniulation
	(3...len).step(2).each do |x|
		total << x
	end

	while total.length > 0
		# Take first number(prime) from total and make it last_prime
		last_prime = total.shift
		# Increase sum by last_prime
		sum += last_prime

		# Remove all multiples of last_prime from total array
		total.each do |x|
			total.delete(x) if x % last_prime == 0
		end
	end

	puts sum
	puts Time.now-start
end

# A revised sieve which skips calculations by stepping every 2*n for each
# n^2 until the square root of the limit
def revised_sieve(limit)
	# Create boolean array from 0 to limit
	crosslimit = Math.sqrt(limit)
	sieve = Array.new(limit,false)
	start = Time.now

	# Set all even numbers to true (not prime)
	(4..limit).step(2).each do |n|
		sieve[n] = true
	end

	# Iterate from 3 to squareroot of limit
	(3..crosslimit).step(2).each do |n|
		# If n is prime,
		if !sieve[n]
			# Access all multiples of n above crosslimit and set not prime
			(n**2..limit).step(2*n).each do |m|
				sieve[m] = true
			end
		end
	end

	# Add all prime numbers in sieve for answer
	sum = 0
	(2..limit).each do |n|
		sum += n if !sieve[n]
	end

	puts sum
	puts Time.now-start
end

# Testing speed of both algorithms
sieve_eratosthenes(10000) # 2.17128 seconds
sum_primes(10000) 				# 0.076506 seconds
revised_sieve(10000)			# 0.009 seconds

#Final run
sum_primes(2000000)				# 950.96084 seconds
# Returns correct answer of 142913828922

revised_sieve(2000000)		# 2.983171 seconds
# Returns correct answer of 142913828922