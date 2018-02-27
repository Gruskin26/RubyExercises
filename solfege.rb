=begin

@author Michael Gruskin - Mag5856@rit.edu

solfege.rb takes in a note of the musical scale to use as the tonic, 
and then a solfege note to find in the appropriatei (major) scale.

In this case, the musical scale will use sharps only

=end

notes = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

solfege = ["Do", "Re", "Mi", "Fa", "Sol", "La", "Ti"]

# Define a usage function to print if we have errors
def usage()
	puts "Usage: ruby solfege.rb <letterNote> <solfegeNote>"
	exit
end

# Check that we got command line args
if ARGV.length == 0
	usage()
end

# Read in and capitalize args
letter, sol = ARGV
letter = letter.capitalize
sol = sol.capitalize

# Validate arguments
if not (notes.include? letter) or not (solfege.include? sol)
	usage()
end

# Get the index of our tonic
tonic = notes.index(letter)

# Figure out how many notes away our new note is
distance = solfege.index(sol)
# This is a bit weird, but what happens is that because fa is only a half step
# from mi, everything is thrown off by one. So what we do is say that if the
# distance from the tonic is past fa, we subtract one half step.
distance = distance * 2
if distance >= 6
	distance -= 1
end

# This is a bit confusing on the logic, but basically, if our distance is
# tonic plus our distance is still within the array bounds, we can print that
# note and call it a day.

# If not, we need to take that distance, and subtract the bounds of our array
# in this case, 12 notes. This new index will be our goal.
if distance + tonic < 12
	puts notes[distance + tonic]
	exit
else
	puts notes[distance + tonic - 12]
	exit
end
