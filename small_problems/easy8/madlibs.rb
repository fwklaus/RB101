# Input: user input
# Output: display interpolated string

# Rules:
#   -Explicit:
#        -create a story template for blank words
#        -prompt user for words:
#                  - noun
#                  - verb
#                  - adverb
#                  - adjective
#       -create a story
#       -display story with interpolated user input

# Data Structure/Algorithm:
#  -prompt user for words(noun, verb, adverb, adjective)
#         - assign input to corresponding variable
#  -write a story
#      -interpolate user inputs
#  -display interpolated story


puts"Enter a noun: "
noun = gets.chomp

puts"Enter a verb: "
verb = gets.chomp

puts"Enter an adjective: "
adjective = gets.chomp

puts"Enter an adverb: "
adverb = gets.chomp

puts "How many #{noun}('s) #{verb} where you come from? Interesting, I'll #{adverb} write that in my #{adjective} diary. "





# example:
# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!