#A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:
#1/2	= 	0.5
#1/3	= 	0.(3)
#1/4	= 	0.25
#1/5	= 	0.2
#1/6	= 	0.1(6)
#1/7	= 	0.(142857)
#1/8	= 	0.125
#1/9	= 	0.(1)
#1/10	= 	0.1
#Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
#Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

def reciprocal_cycles(limit)
	longest = 0
	# Discard non-recurring numbers because they end in 0
 
	(1...limit).each do |x|
		# Stored as [value] = position
    foundRemainders = []
    foundRemainders[1] = 0
    value = 1;
    position = 0;
 		
 		# Find Remainders for x
    while foundRemainders[value] == 0 && value != 0
      foundRemainders[value] = position
      value *= 10
      value = (value/x)%10
      position += 1
    end
    puts foundRemainders
	end

end

reciprocal_cycles(11)