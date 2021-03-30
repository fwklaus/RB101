# Build a program that displays when the user will retire and how many years
# she has to work till retirement.

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!


YEAR = 2021

def retirement
print "What is your age? "
age = gets.chomp.to_i

print "At what age would you like to retire? "
ret_age = gets.chomp.to_i

years_to_ret = ret_age - age
ret_year = YEAR + years_to_ret

puts"It's #{YEAR}. You will retire in #{ret_year}."
puts "You only have #{years_to_ret} years of work to go!"

end



retirement