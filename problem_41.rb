#We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once.
#For example, 2143 is a 4-digit pandigital and is also prime.
#What is the largest n-digit pandigital prime that exists?

# A method to check if a number is prime
# Used by the pandigital_primes method
def is_prime?(num)
	# Check if num divisible by 2
  return false if num % 2 == 0 && num > 2
  # Otherwise check odd numbers
  (3..Math.sqrt(num)).step(2).each do |n|
  	return false if num%n == 0
  end
  return true;
end

def pandigital_primes
	# Variable to store all pandigital primes
	@pandigital_primes = []
	# Digits to check, have to be in ascending order
	@digits = "123456789"

	# Recursion function that creates pandigital numbers
	def get_pan(number, available_digits)
		# If available numbers left, add digit and call function with remaining digits
		if available_digits.length > 1
			available_digits.each_char do |x|
				get_pan(number+x,available_digits.delete(x))
			end
		else
			# If last digit, push pandigital to pandigital array if prime
			@pandigital_primes << (number+available_digits).to_i if is_prime?((number+available_digits).to_i)
		end
	end

	# Call recursion function for every range of numbers from 1 to n, where n decreases each loop
	while @digits.length > 1
		get_pan("",@digits[0...@digits.length])
		@digits = @digits[0...@digits.length-1]
	end

	# Print highest pandigital_prime
	puts @pandigital_primes.max
end

pandigital_primes
# Returns 7652413