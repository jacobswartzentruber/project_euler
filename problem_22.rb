#Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
#For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
#What is the total of all the name scores in the file?

# Opens file, removes quotation marks and commas and returns names as an array
def get_names
	myFile = File.open('p022_names.txt', 'r')
	names = myFile.read
	names = names.split(",").each {|x| x.delete! "\"" }
  myFile.close
  return names
end

def name_scores
	@names = get_names

	# Quicksort algorithm to sort names using recursion
	def quicksort(lo, hi)
		if lo < hi
	    p = partition(lo, hi)
	    quicksort(lo, p - 1)
	    quicksort(p + 1, hi)
	  end
	end

	# lo is the index of the leftmost element of the subarray
	# hi is the index of the rightmost element of the subarray (inclusive)
	def partition(lo, hi)
		pivot_index = hi
		pivot_value = @names[pivot_index]
		store_index = lo

		# Compare remaining array elements against pivotValue = A[hi]
		(lo...hi).each do |i|
		  if @names[i] < pivot_value
		   	@names[i], @names[store_index] = @names[store_index], @names[i]
		    store_index += 1
		  end
		end
		# Move pivot to its final place
		@names[hi], @names[store_index] = @names[store_index], @names[hi]  
		return store_index
	end

	# Alphabetize names
	quicksort(0, @names.length-1)

	# Sum alphabetized scores for all names
	answer = 0
	@names.each_with_index do |name, i|
		name_value = 0
		name.each_char do |c|
			# Find char value by accessing its encoded value
			# Since they are capital letters, subtract by 64 to obtain correct
			# ex: "A".ord == 65 so "A".ord - 64 == 1
			name_value += c.ord - 64
		end
		# Increment answer by name_value multiplied by its ordered index
		answer += name_value*(i+1)
	end
	puts answer
end

name_scores
# Returns 871198282