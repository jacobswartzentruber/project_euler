#The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right,
#and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
#Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
#NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

# Method to determine if a given number is prime
def is_prime?(num)
	# Return false for 1
	return false if num == 1
	# Check if num divisible by 2
  return false if num % 2 == 0 && num > 2
  # Otherwise check odd numbers
  (3..Math.sqrt(num)).step(2).each do |n|
  	return false if num%n == 0
  end
  return true;
end

# Method to remove digits one by one in a specified direction and check if all nums are prime
def shift_prime?(digits, direction)
	digits.length.times do
		# Return false if variation is not prime
		return false unless is_prime?(digits.join.to_i)
		# Remove first digit if direction is right, remove last digit if direction is left
		direction ? digits.shift : digits.pop
	end
	# If all variations prime, return true
	return true
end

def truncatable_primes(limit)
	primes = []
	num = 10
	# Find truncatable primes until specified limit
	while primes.length < limit
		# Add number to array if all variations of num prime in both directions
		primes << num if shift_prime?(num.to_s.split(""), true) && shift_prime?(num.to_s.split(""), false)
		num += 1
	end
	# Output sum of all numbers in prime array
	puts primes.inject(:+)
end

truncatable_primes(11)
# Returns 748317