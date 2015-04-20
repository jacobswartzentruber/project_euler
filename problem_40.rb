#An irrational decimal fraction is created by concatenating the positive integers:
#0.123456789101112131415161718192021...
#It can be seen that the 12th digit of the fractional part is 1.
#If dn represents the nth digit of the fractional part, find the value of the following expression.
#d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

def champernowne_constant(power)
	# Find all digits positions that will be calculated
	digit_indices = []
	(0..power).each {|d| digit_indices << 10**d}
	
	product = 1
	counter = 0
	digit = 0

	# Continue adding numbers together until above the last digit to be calculated
	while digit < digit_indices.last
		# Get next number for checking digits
		counter += 1
		number = counter
		# Run through all digits of number and multiply with product if digit_indices includes digit
		number.to_s.each_char do |d|
			digit += 1
			product *= d.to_i if digit_indices.include?(digit.to_i)
		end
	end

	puts product
end

champernowne_constant(6)
# Returns 210