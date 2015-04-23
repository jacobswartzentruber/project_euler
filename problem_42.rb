#The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:
#1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value.
#For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.
#Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?

def get_words
	# Open file and put words in an array
	file = File.open('p042_words.txt', 'r')
	words = file.read
	words = words.split(",").each {|x| x.delete! "\"" }
  file.close
  return words
end

def triangle_words
	triangles = 0
	# Store words in an array
	words = get_words

	# For each word, determine if it is a triangle number
	words.each do |word|
		# Find word value for each current word
		word_value = 0
		word.each_char do |c|
			# Find char value by accessing its encoded value
			# Since they are capital letters, subtract by 64 to obtain correct
			# ex: "A".ord == 65 so "A".ord - 64 == 1
			word_value += c.ord - 64
		end

		# Keep calculating triangle numbers up from n = 1 until a match or over the word_value
		@n = 1
		while @n*(@n+1)/2 <= word_value
			# If a match, increase out triangle count by 1
			triangles += 1 if @n*(@n+1)/2 == word_value
			@n += 1
		end
	end
	puts triangles
end

triangle_words
# Returns 162