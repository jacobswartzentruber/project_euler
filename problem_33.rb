#The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
#We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
#If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

def digit_cancel_fractions
	answer = {}
	#Iterate through each possible repeating digit included in top and bot
	(1..9).each do |x|
		#Iterate through possible remaining top digits
		(1..9).each do |t|
			#Check all top numbers with x digit followed by t digit
			top_number = x*10.0+t
			(t..9).each do |b|
				# Check all bottom numbers with x digit and b digit. Add large fraction to answer if unique fraction matches
				bottom_number = x*10.0+b
				answer[top_number] = bottom_number if top_number/bottom_number == t/(b*1.0) && t!=b
				bottom_number = x+b*10.0
				answer[top_number] = bottom_number if top_number/bottom_number == t/(b*1.0) && t!=b
			end

			#Check all top numbers with t digit followed by x digit
			top_number = x+t*10.0
			(t..9).each do |b|
				# Check all bottom numbers with x digit and b digit. Add large fraction to answer if unique fraction matches
				bottom_number = x*10.0+b
				answer[top_number] = bottom_number if top_number/bottom_number == t/(b*1.0) && t!=b
				bottom_number = x+b*10.0
				answer[top_number] = bottom_number if top_number/bottom_number == t/(b*1.0) && t!=b
			end
		end
	end
	puts answer

	top_prod = 1
	bot_prod = 1
	answer.each do |top,bottom|
		top_prod *= top
		bot_prod *= bottom
	end

	puts top_prod
	puts bot_prod

end

digit_cancel_fractions
# Returns 387296/3729600
# Simplifies to 1/100