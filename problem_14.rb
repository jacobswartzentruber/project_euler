#The following iterative sequence is defined for the set of positive integers:
#n → n/2 (n is even)
#n → 3n + 1 (n is odd)
#Using the rule above and starting with 13, we generate the following sequence:
#13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
#It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#Which starting number, under one million, produces the longest chain?

def longest_collatz(limit)
	# Variables to track largest chain and associated number
	largest_num = 0
	largest_count = 0

	# Run through all iterations from 1 to supplied limit
	(1...limit).each do |num|
		x = num
		count = 1

		#Apply algorithm to x until x == 1, count for each iteration
		until x == 1
			if x%2 == 0
				x /= 2
			else
				x = 3*x+1
			end
			count += 1
		end

		# Assign largest_num and largest_count if count is highest so far
		if count > largest_count
			largest_num = num
			largest_count = count
		end
		
	end
	puts largest_num.to_s + " " + largest_count.to_s
end

longest_collatz(1000000)
# Returns 837799 with a chain length of 525