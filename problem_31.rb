#In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
#1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
#It is possible to make £2 in the following way:
#1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
#How many different ways can £2 be made using any number of coins?

def coin_factor
	@coins = [1, 2, 5, 10, 20, 50, 100, 200]

	def find_coin(remainder, index)
		# If lowest coin, return 1
		return 1 if index <= 0

		#For each coin, recursive function to determine which lower coins fit into remainder
		sum = 0
		while remainder >= 0
			# set path for next lowest coin and calculate remaining pence
			sum += find_coin(remainder, index-1)
			remainder -= @coins[index]
		end
		return sum
	end

	puts find_coin(@coins.last, @coins.length-1)
end

coin_factor
# Returns 73682