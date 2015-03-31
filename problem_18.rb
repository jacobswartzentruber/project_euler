#By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
#3
#7 4
#2 4 6
#8 5 9 3
#That is, 3 + 7 + 4 + 9 = 23.
#Find the maximum total from top to bottom of the triangle below:

def max_sum_triangle

	number = "75 95 64 17 47 82 18 35 87 10 20 04 82 47 65 19 01 23 75 03 34 88 02 77 73 07 63 67 99 65 04 28 06 16 70 92 41 41 26 56 83 "
	number += "40 80 70 33 41 48 72 33 47 32 37 16 94 29 53 71 44 65 25 43 91 52 97 51 14 70 11 33 28 77 73 17 78 39 68 17 57 91 71 52 "
	number += "38 17 14 91 43 58 50 27 29 48 63 66 04 68 89 53 67 30 73 16 69 87 40 31 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

	# Place triangle in an array which is easier to manipulate
	@triangle = []
	counter = 0
	number = number.split(" ")
	while number.length > 0
		counter += 1
		row = []
		counter.times { row << number.shift }
		@triangle << row
	end

	# Recursion method that returns the greater sum of the current cell and 
	# each of the two adjacent cells in the next row
	def add_num(row, col)
		# If last row, simply return the cell number
		return @triangle[row][col].to_i if row == @triangle.length-1

		# Find the adjacent two cells in the next row and add current cell's value
		a = add_num(row+1,col) + @triangle[row][col].to_i
		b = add_num(row+1,col+1) + @triangle[row][col].to_i
		# Return the greater of the two sums
		return [a,b].max

	end

	#Start the recursion at cell 0,0
	puts add_num(0,0)
end

max_sum_triangle
# Returns 1074