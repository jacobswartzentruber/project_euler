#A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#a^2 + b^2 = c^2
#For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#There exists exactly one Pythagorean triplet for which a + b + c = 1000.
#Find the product abc.

def special_pyth_triplet
	# Iterate through all possible a values
	(1..999).each do |a|
		#Iterate through all possible b values
		(1...999).each do |b|
			# Since a+b+c = 1000 then c = 1000-a-b
			# Only one possible answer so,
			# Print product abc if a and b values fit pythagorean theorum
			puts a*b*(1000-a-b) if a**2 + b**2 == (1000-a-b)**2
		end
	end
end

special_pyth_triplet
# Returns 31875000