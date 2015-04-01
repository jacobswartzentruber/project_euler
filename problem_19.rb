#You are given the following information, but you may prefer to do some research for yourself.
#1 Jan 1900 was a Monday.
#Thirty days has September,
#April, June and November.
#All the rest have thirty-one,
#Saving February alone,
#Which has twenty-eight, rain or shine.
#And on leap years, twenty-nine.
#A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
#How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

def first_sundays(start_day, start_year, end_year)
	counter = 0
	# 0 = sunday, 1 = monday, 2 = tuesday... 6 = saturday
	@next = start_day

	# Iterate from start_year to end_year
	(start_year..end_year).each do |y|
		# Generate year with number of days per month
		months = generate_year(y)

		months.each do |m|
			m.times do |d|
				# Add 1 to counter if sunday is first day of month unless 1900
				# because we begin counting at 1901
				if @next == 0 && d == 0
					counter += 1 unless y == start_year
				end
				# Set @next equal to what the next day of the week will be
				@next += 1
				@next = 0 if @next == 7
			end
		end
	end
	puts counter
end

def generate_year(year)
	# Define months array to hold correct days for each month
	months = []
	(1..12).each do |m|
		# Set correct number of days for each month
		leap_year = false
		days = 31 if [1,3,5,7,8,10,12].include?(m)
		days = 30 if [4,6,9,11].include?(m)

		# Determine if this year is a leap year
		if year%4 == 0
			leap_year = true
			if year%100 == 0
				leap_year = false unless year%400 == 0
			end
		end

		# Set February days according to leap year or not
		if m == 2
			leap_year ? days = 29 : days = 28
		end

		months << days
	end
	return months
end

# Starting at 1900 because we need to calculate correct days of week
# even if we aren't looking to count the first sundays of that year
first_sundays(1, 1900, 2000)
# Returns 171