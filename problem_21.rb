#Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
#If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
#For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#Evaluate the sum of all the amicable numbers under 10000.

def amicable_numbers(limit)
	divisor_sum = {}
	(1...limit).each do |num|
		sum = 1
		#Start counting factors for num
		#Only need to go up to sqrt of triangle for factors
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
		# Add num and sum to the array
		divisor_sum[num] = sum
	end

	# Sum all amicable numbers from array
	sum = 0
	divisor_sum.each do |key, value|
		sum += key if key != value && divisor_sum[value] == key
		puts key.to_s + " " + value.to_s if key != value && divisor_sum[value] == key
	end
	puts sum
end

amicable_numbers(10000)
# Returns 31626