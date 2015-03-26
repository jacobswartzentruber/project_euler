#A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#Find the largest palindrome made from the product of two 3-digit numbers.

def is_palindrome?(num)
	num = num.to_s
	# Go down array, checking each number against its relevant counterpart down the line
	num.length.times do |x|
		return false unless num[x] == num[num.length-1-x]
	end
	true
end

def largest_palindrome
	# Define largest three digit numbers possible
	first = 999
	second = 999
	# Create a blank array to store confirmed palindromes
	palindromes = []

	# Check all possible products between 0-999 for first and second
	# If product is a palindrome, add it to the array
	first.times do |f|
		second.times do |s|
			p = (f+1) * (s+1)
			palindromes << p if is_palindrome?(p)
		end
	end

	# Return largest palindrome found
	palindromes.max
end

# Testing to see if is_palindrome? works
puts is_palindrome?(40004)
puts is_palindrome?(56788765)
puts is_palindrome?(345245)

puts largest_palindrome
# Returns 906609