#Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
#21 22 23 24 25
#20  7  8  9 10
#19  6  1  2 11
#18  5  4  3 12
#17 16 15 14 13
#It can be verified that the sum of the numbers on the diagonals is 101.
#What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

def sum_diagonals(width)
	# Start on 1 so sum = 1
	sum = 1
	counter = 1
	# Iterate through number of layers of spiral
	(2...width).step(2).each do |x|
		# Sum diagonals for each side
		4.times do
			counter += x
			sum += counter
		end
	end
	puts sum
end

sum_diagonals(1001)
# Returns 669171001