#The sum of the squares of the first ten natural numbers is,
#1^2 + 2^2 + ... + 10^2 = 385
#The square of the sum of the first ten natural numbers is,
#(1 + 2 + ... + 10)^2 = 55^2 = 3025
#Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
#Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

# Calculate sum of squares
def sum_of_squares(x)
	sum = 0
	# Iterate through all numbers from 1 to x
	(1..x).each do |n|
		# For each number square it and add them all together
		sum += n ** 2
	end
	sum
end

# Calculate square of sums
def square_of_sums(x)
	sum = 0
	# Add all numbers from 1 to x togther
	(1..x).each do |n|
		sum += n
	end
	# Return the square of the sum
	sum ** 2
end

puts sum_of_squares(10)
puts square_of_sums(10)

# To find difference, subtract square_of_sums from sum_of_squares
puts square_of_sums(100)-sum_of_squares(100)
# Returns 25,164,150