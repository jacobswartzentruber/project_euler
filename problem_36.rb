#The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
#Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
#(Please note that the palindromic number, in either base, may not include leading zeros.)

# Checks if number is a palindrome
def is_palindrome?(num)
	num = num.to_s
	# Go down array, checking each number against its relevant counterpart down the line
	num.length.times do |x|
		return false unless num[x] == num[num.length-1-x]
	end
	true
end

def double_base_palindrome(limit)
	sum = 0
	# Run through all numbers 1 to limit
	(1..limit).each do |x|
		# Verify number is palindrome and if base(2) of number is palindrome.  Add to sum
		sum += x if is_palindrome?(x) && is_palindrome?(x.to_s(2).to_i)
	end
	puts sum
end

double_base_palindrome(1000000)
# Returns 872187