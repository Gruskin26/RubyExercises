=begin

@author - Michael Gruskin - Mag5856@rit.edu

Fib.rb takes in a number, and generates that many digits of the fibonnaci sequence

=end

# Start with the first two numbers, 0 and 1
n_minus_two = 0
n_minus_one = 1

# Prompt the user for a target
print "How many fibonnaci numbers to print: "

# Since ruby's to_i on a string will convert non-number arguments to 0,
# we will say that the argument must be a number 0 or greater
begin
	target_n = gets.to_i
	raise ArgumentError unless target_n > 0
rescue ArgumentError
	puts "That is not a valid number"
	exit
end

# If the user only wants one, we already know it is 0, and can print it
if target_n == 1
	puts n_minus_two
	exit
end

# Otherwise, we can safely print the first two, set n to be two, and loop
# until we reach our goal
puts n_minus_two
puts n_minus_one
n = 2
while n < target_n
	# n = (n-1) + (n-2)
	current = n_minus_one + n_minus_two
	# (n-2) = (n-1)
	n_minus_two = n_minus_one
	# (n-1) = n
	n_minus_one = current
	# Print the current n, and increment our counter
	puts current
	n += 1
end

