#The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
#There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#How many circular primes are there below one million?

# A method to check if a number is prime
# Used by the circular_primes method
def is_prime?(num)
	# Check if num divisible by 2
  return false if num % 2 == 0 && num > 2
  # Otherwise check odd numbers
  (3..Math.sqrt(num)).step(2).each do |n|
  	return false if num%n == 0
  end
  return true;
end

def circular_primes(limit)
	sum = 0
	(2...limit).each do |x|
		puts x
		all_prime = true
		digits = x.to_s.split("")
		digits.length.times do
			unless is_prime?(digits.inject(:+).to_i)
				all_prime = false 
				break
			end
			digits.rotate!
		end
		sum += 1 if all_prime
	end
	puts sum
end

# Testing with given number
circular_primes(100)

circular_primes(1000000)
# Returns 55
# Brute force method.  Takes a long time however can't find any more optimization