# Function to generate a list of emails, of which 50% of them have duplicates
# Num_emails is the size of the email list
def generate_email_list(num_emails)
	puts "Generating Email list"
	emails = []
	while emails.length < num_emails
		# Create randomized strings of letters for name and domain
		name = (0...15).map{(97 + rand(26)).chr}.join
		domain = (0...10).map{(65 + rand(26)).chr}.join
		email = name+'@'+domain+'.com'

		# First fill 50% of array with non-repeating emails
		if emails.length < num_emails/2
			emails << email
		# Then fill the rest of array with duplicating emails at random intervals 	
		else
			emails.insert(rand(emails.length), email)
			emails.insert(rand(emails.length), email)
		end
	end
	puts "Email List Complete"
	puts "Displaying first ten emails"
	emails[0...10].each {|email| puts email}
	return emails
end

# Function to remove all duplicates of an array of emails, leaving the remaining list
# in the original order
def remove_duplicate_emails(emails)
	# Create a hash to store number of times email is accessed where the default value is zero
	check = Hash.new(0)
	final = []

	# Check uniqueness for each email in list
	emails.each do |email|
		# If hash value for email is still 0, add email to final array
		# and indicate email has been accessed in hash by incrementing by 1.
		# Otherwise, email has already been accessed so nothing is done
		if check[email] == 0
			check[email] += 1
			final << email
		end
	end
	return final
end

# Generate an email list with 100,000 emails
emails = generate_email_list(100000)
start = Time.now
remove_duplicate_emails(emails)
puts "Time to remove duplicates: " + (Time.now-start).to_s