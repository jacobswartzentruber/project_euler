#2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def smallest_multiple(limit)
	answer = 1
	# Iterate from 1 to the highest divisor
	(1..limit).each do |x|
		# Find the smallest multiple for each number in the set
		(1..x).each do |y|
			# Take previous smallest multiple in set and test by 
			# multiplying from (1..current number).  If a match,
			# break and go on to the next number in set
			if (answer*y)%x == 0
				answer *= y
				break
			end
		end
	end
	answer
end

puts smallest_multiple(2)
puts smallest_multiple(3)
puts smallest_multiple(4)
puts smallest_multiple(10)
puts smallest_multiple(20)
# Returns 232792560