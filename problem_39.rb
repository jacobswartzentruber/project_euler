#If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.
#{20,48,52}, {24,45,51}, {30,40,50}
#For which value of p ≤ 1000, is the number of solutions maximised?

def integer_right_tri(limit)
	result = 0		# Variable to store final perimeter
	largest = 0		# Variable to max amount of sums
	(1..limit).each do |perimeter|
		sum = 0
		# Cycle through available a and b values for perimeter
		(1..perimeter/3).each do |a|
			(a..perimeter).each do |b|
				# Increment sum by 1 if a^2 + b^2 = c^2
				sum += 1 if a**2 + b**2 == (perimeter-a-b)**2
			end
		end
		# If calculated sum for specified perimeter is largest so far, set largest and result
		if sum > largest
			largest = sum
			result = perimeter
		end
	end
	puts result
end

integer_right_tri(1000)
# Returns 840