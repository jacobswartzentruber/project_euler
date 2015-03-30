#The 6K text file, sudoku.txt (right click and 'Save Link/Target As...'), contains fifty different Su Doku puzzles ranging in difficulty, but all with unique solutions (the first puzzle in the file is the example above).
#By solving all fifty puzzles find the sum of the 3-digit numbers found in the top left corner of each solution grid; for example, 483 is the 3-digit number found in the top left corner of the solution grid above.

def sudoku_solver
	puzzle_array = []
	get_puzzles.each do |x|
		puzzle_array << Puzzle.new(x)
	end

	puzzle_array.each_with_index do |puzz, index|
		puts "PUZZLE #"+ index.to_s + "\n"
		running = true
		puzz.display
		while running
			puzz.update_possible
			running = false if puzz.update_and_end?
			puzz.display
			gets.chomp
		end
	end
end

class Puzzle
	def initialize(grid)
		@grid = grid
	end

	def display
		print "\n"
		(0..8).each do |row|
			(0..8).each do |col|
				cell = @grid[row][col]
				print cell[:final]
				#print " ("+row.to_s+","+col.to_s+") "
			end
			print "\n"
		end
	end

	def update_possible
		(0..8).each do |row|
			(0..8).each do |col|
				cell = @grid[row][col]
				# Only update unfilled squares
				if cell[:final] == "0"

					# Check row for matches
					check_row = []
					(0..8).each do |x|
						temp = @grid[row][x]
						check_row << temp[:final] unless temp[:final] == "0"
					end
					unique = return_unique(cell[:possible], check_row)
					matches = cell[:not_possible] | check_row
					@grid[row][col] = {final: "0", possible: unique, not_possible: matches}

					# Check column for matches
					check_col = []
					(0..8).each do |y|
						temp = @grid[y][col]
						check_col << temp[:final] unless temp[:final] == "0"
					end
					cell = @grid[row][col]
					unique = return_unique(cell[:possible], check_col)
					matches = cell[:not_possible] | check_col
					@grid[row][col] = {final: "0", possible: unique, not_possible: matches}

					# Check block for matches
					check_block = []
					col_start = (col/3)*3
					row_start = (row/3)*3
					(col_start..col_start+2).each do |x|
						(row_start..row_start+2).each do |y|
							temp = @grid[y][x]
							check_block << temp[:final] unless temp[:final] == "0"
						end
					end
					cell = @grid[row][col]
					unique = return_unique(cell[:possible], check_block)
					matches = cell[:not_possible] | check_block
					@grid[row][col] = {final: "0", possible: unique, not_possible: matches}
					puts "Cell["+row.to_s+"]["+col.to_s+"] "+cell[:final]+" "+ cell[:possible].to_s+" "+cell[:not_possible].to_s
					#puts "\n"
				end
			end
		end
	end

	def update_and_end?
		no_zeros = true
		(0..8).each do |row|
			(0..8).each do |col|
				cell = @grid[row][col]
				if cell[:final] == "0"
					no_zeros = false

					#Check to see if every other cell but current has same not_possible numbers
					#Checking row
					matches = ["1","2","3","4","5","6","7","8","9"]
					(0..8).each do |x|
						temp = @grid[row][x]
						#puts "Temp["+x.to_s+"]["+y.to_s+"] to "+temp[:not_possible].to_s if col_start==0 && row_start==0
						matches = matches & temp[:not_possible] unless cell == temp
					end
					unless matches.empty?
						cell[:final] = matches.first
						@grid[row][col] = cell
						puts "Changed cell["+row.to_s+"]["+col.to_s+"] to "+cell[:final]+" ROW"
					end

					#Checking col
					matches = ["1","2","3","4","5","6","7","8","9"]
					(0..8).each do |y|
						temp = @grid[y][col]
						#puts "Temp["+x.to_s+"]["+y.to_s+"] to "+temp[:not_possible].to_s if col_start==0 && row_start==0
						matches = matches & temp[:not_possible] unless cell == temp
					end
					unless matches.empty?
						cell[:final] = matches.first
						@grid[row][col] = cell
						puts "Changed cell["+row.to_s+"]["+col.to_s+"] to "+cell[:final]+" COL"
					end

					#Check block
					col_start = (col/3)*3
					row_start = (row/3)*3
					matches = ["1","2","3","4","5","6","7","8","9"]
					(col_start..col_start+2).each do |x|
						(row_start..row_start+2).each do |y|
							temp = @grid[y][x]
							#puts "Temp["+x.to_s+"]["+y.to_s+"] to "+temp[:not_possible].to_s if col_start==0 && row_start==0
							matches = matches & temp[:not_possible] unless cell == temp
						end
					end
					unless matches.empty?
						cell[:final] = matches.first
						@grid[row][col] = cell
						puts "Changed cell["+row.to_s+"]["+col.to_s+"] to "+cell[:final]+" BLOCK"
					end

					#Check to see if one possible number remains in current cell
					if cell[:possible].length == 1
						cell[:final] = cell[:possible].first
						@grid[row][col] = cell
						puts "Changed cell["+row.to_s+"]["+col.to_s+"] to "+cell[:final]
					end
				end
			end
		end
		no_zeros
	end

	def return_unique(poss, group_to_check)
		uniques = poss & group_to_check
		return poss - uniques
	end

end

def get_puzzles
	puzzle_array = []
	problem_num = 0
	row = []
	myFile = File.open('p096_sudoku.txt', 'r')
	myFile.each do |line|
  	if line.include? "Grid"
  		row = []
  	else
  		column = []
  		line.each_char do |n|
  			unless n == "\n"
  				poss = []
  				not_poss = []
  				if n == "0"
  					poss = ["1","2","3","4","5","6","7","8","9"]
  				else
  					("1".."9").each do |x|
  						not_poss << x unless x == n
  					end
  				end
  				value = {final: n, possible: poss, not_possible: not_poss}
  				column << value 
  			end
  		end
  		row << column
  		puzzle_array << row if row.size == 9
  	end
  end
  myFile.close
  return puzzle_array
end

sudoku_solver