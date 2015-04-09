#Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
#1634 = 14 + 64 + 34 + 44
#8208 = 84 + 24 + 04 + 84
#9474 = 94 + 44 + 74 + 44
#As 1 = 14 is not a sum it is not included.
#The sum of these numbers is 1634 + 8208 + 9474 = 19316.
#Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

def digit_pow
	# Need x digits where x*9^5 has same number of digits
	# 6*9^5 = 354294 has six digits so we should be good with 6
	sum = 0
	(2..355000).each do |n|
		sum_powers = 0
		number = n
		# Sum each digit in number raised to the power of 5
		until number == 0
			number%10 == number ? sum_powers += number**5 : sum_powers += (number%10)**5
			number /= 10
		end
		# If sum of the powers is equal to the number, add to the final tally
		sum += sum_powers if sum_powers == n
	end
	puts sum
end

digit_pow
# Returns 443839