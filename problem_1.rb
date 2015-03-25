#If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
#The sum of these multiples is 23.
#Find the sum of all the multiples of 3 or 5 below 1000.

def three_five_multiples(num)
	sum = 0

	# Iterate through the given number
	num.times do |n|
		#If it is divisible by 3 or 5, add n to sum
		if n%3 == 0 || n%5 == 0
			sum += n
		end
	end
	#prints sum
	puts sum
end

three_five_multiples(10)
three_five_multiples(1000)
# Returns 233169 as answer