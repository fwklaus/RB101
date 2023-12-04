puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

year = 2021
years_to_go = retirement_age - age
retirement_year = years_to_go + year

puts "It's #{year}. You will retire in #{retirement_year}."
puts "You only have #{years_to_go} years of work to go!"


