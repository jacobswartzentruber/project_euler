#Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
#How many such routes are there through a 20×20 grid?

def lattice_paths(width, height)
	# Record discovered sum of paths for each node to prune recursion tree
	@node = []
	(0..height).each do |y|
		row = []
		(0..width).each do |x|
			row << 0
		end
		@node << row
	end
	
	# Calculate the sum of the previous paths' path count for path(x,y)
	def path(x, y)
		# If x or y are on the edge, meaning they have only one path, return 1
		if (x == 0 || y == 0)
			return 1
	
		# If in the middle of the square, check to see if sum of paths for node already calculated?
		else
			# If so, return calculated sum of paths for node
			if @node[x][y] != 0
				return @node[x][y]
				
			# Otherwise, set node[x][y] to sum of paths for connected nodes through recursion
			# Return newly calculated node[x][y]
			else
				@node[x][y] = path(x-1, y) + path(x, y-1)
				return @node[x][y]
			end
		end	
	end
	puts path(width,height)
end

# Testing smaller squares
lattice_paths(1,1)
lattice_paths(2,2)
lattice_paths(3,3)

lattice_paths(20,20)
# Returns 137846528820