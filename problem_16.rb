#2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#What is the sum of the digits of the number 2^1000?

def power_sum_digit(pow)
	num = 2 ** pow
	sum = 0
	# Convert number to string to easily manipulate digits
	num.to_s.each_char {|c| sum += c.to_i}
	puts sum
end

power_sum_digit(1000)
# returns 1366