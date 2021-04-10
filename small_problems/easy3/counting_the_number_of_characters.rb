# Write a program that will ask a user for an input of a word or multiple 
# words and give back the number of characters. Spaces should not be counted
# as a character.

print "Please write word or multiple words: "
input = gets.chomp

input_array = input.split(//)
input_array.delete(' ')
character_count = input_array.count

puts "There are #{character_count} characters in \"#{input}\"."

#___________________launch_solution_____________________


print 'Please write word or multiple words: '
input = gets.chomp
number_of_characters = input.delete(' ').size
puts "There are #{number_of_characters} characters in \"#{input}\"."

