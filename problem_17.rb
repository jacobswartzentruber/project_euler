#If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
#NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
#The use of "and" when writing out numbers is in compliance with British usage.

def letter_counts(limit)
	# Define word for cooresponding number
	numbers_to_words = {one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9, ten: 10,
										  eleven: 11, twelve: 12, thirteen: 13, fourteen: 14, fifteen: 15, sixteen: 16, seventeen: 17, eighteen: 18,
										  nineteen: 19, twenty: 20, thirty: 30, forty: 40, fifty: 50, sixty: 60, seventy: 70, eighty: 80, ninety: 90}

	#Variable to count total length
	count = 0
	# Iterate through every number up to limit
	(1..limit).each do |num|
		# word variable will store word string for current number
		word = ""
		# Convert number to array so it is easier to manipulate
		num_array = num.to_s.split("")

		# If only one digit long, simply assign key to word
		if num_array.length == 1
			x = num_array.join.to_i
			word << numbers_to_words.key(x).to_s
		end

		# If four digits long, add "one thousand" to number
		if num_array.length == 4
			num_array.shift
			word << "onethousand"

		# If at least three digits, add relevant 1 through 9 key with "hundred"
		elsif num_array.length >= 3
			x = num_array.shift.to_i
			word << numbers_to_words.key(x).to_s
			word << "hundred"
			# If number continues after third digit, include "and"
			word << "and" unless num_array == ["0","0"]
		end

		# If at least a two digit number,
		if num_array.length >= 2
			# If higher than 20, add relevant 'multiple of ten' key before single key
			if num_array.join.to_i > 20
				x = num_array.shift.to_i * 10
				word << numbers_to_words.key(x).to_s
				x = num_array.join.to_i
				word << numbers_to_words.key(x).to_s
			# If less than 20, simply assign key to word
			else
				x = num_array.join.to_i
				word << numbers_to_words.key(x).to_s
			end
		end

		# Output entire word and increase count by word length
		puts word
		count += word.length
	end
	puts count
end

#Testing given numbers
letter_counts(5)

letter_counts(1000)
# Returns 21124