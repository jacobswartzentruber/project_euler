#The Fibonacci sequence is defined by the recurrence relation:
#Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
#The 12th term, F12, is the first term to contain three digits.
#What is the first term in the Fibonacci sequence to contain 1000 digits?

def fibonacci_1000

	f1 = 1
	f2 = 1
	counter = 2

	# Find next Fibonacci number and document nth term
	until f2.to_s.length >= 1000
		f1, f2 = f2, f1+f2
		counter += 1
	end

	puts counter
end

fibonacci_1000
# returns 4782