#The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
#Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

def power_powers(digit)
	answer = (1..digit).inject {|sum, num| sum + num**num}
	puts answer.to_s[-10..-1]
end

power_powers(10)
power_powers(1000)