#n! means n × (n − 1) × ... × 3 × 2 × 1
#For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
#and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#Find the sum of the digits in the number 100!

def sum_factorial(num)
	# Find factorial of number
	factorial = 1
	num.times {|x| factorial *= (x+1)}
	puts factorial

	# Add all digits of factorial together
	# Converted factorial to string to make manipulation of digits easier
	sum = 0
	factorial.to_s.split("").each {|x| sum += x.to_i}
	puts sum
end

# Testing known number
sum_factorial(10)

sum_factorial(100)
# Returns 648