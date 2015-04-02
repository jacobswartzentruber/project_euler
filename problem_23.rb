#A perfect number is a number for which the sum of its proper divisors is exactly equal to the number.
#For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
#As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24.
#By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers.
#However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
#Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

def non_abundant_sums(limit)
	abundant = []
	# Find all abundant numbers below limit
	(1..limit).each do |num|
		sum = 1
		#Start counting factors for num
		#Only need to go up to sqrt of num for factors
		(2..Math.sqrt(num)).each do |n|
			#If a factor set, increase sum by both factors
			if num%n == 0
				unless n**2 == num
					sum += (n + num/n)
				#If a perfect square, only increase sum by n
				else
					sum += n
				end
			end
		end
		# Check if abundant and add to array
		abundant << num if num < sum
	end

	# Create a boolean hash to store if a number is a non-abundant sum
	non_abundant_sums = {}
	(1..limit).each do |x|
		non_abundant_sums[x] = true
	end

	# Iterate through all abundant numbers and mark false on non_abundant_sums array for all sums
	(0...abundant.length).each do |i|
		puts i
		(i...abundant.length).each do |j|
			non_abundant_sums[abundant[i] + abundant[j]] = false
		end
	end

	# Add all the true non_abundant_sums left over
	sum = 0
	non_abundant_sums.each do |key, value|
		sum += key if value
	end
	puts sum
end

non_abundant_sums(28123)
# Returns 4179871