# 1) In this hash of people and their age, see if "Spot" is present.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.fetch("Spot") # => key not found
ages.has_key?("Spot")
ages.include?("Spot")

#________launch__________

ages.key?("Spot")
ages.include?("Spot")
ages.member?("Spot")

#_______________________________________________________________________________
# 2) Convert the string in the following ways


"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."



munsters_description = "The Munsters are creepy in a good way."

p munsters_description.swapcase
p munsters_description.capitalize 
p munsters_description.downcase
p munsters_description.upcase

#________launch_solution____performs operations destructively

munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.downcase!
munsters_description.upcase!
#_______________________________________________________________________________
# 3) We have most of the Munster family in our age hash...

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

#  ...add ages for Marilyn and Spot to the existing hash:

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

combined_hash = ages.merge(additional_ages)

#_or____destructively

ages.merge!(additional_ages)

#_______________________________________________________________________________
# 4) See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include?("Dino")

#_____launch_solution________

p advice.match?("Dino")

# Note that this is not a perfect solution, as it would match any substring with Dino in it.

#_______________________________________________________________________________
# 5) Show an easier way to write this array:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)


#_______________________________________________________________________________
# 6) How can we add the family pet "Dino" to our usual array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.push("Dino")

#_or__________________

flintstones << "Dino"

#_______________________________________________________________________________
# 7) In the previous practice problem we added Dino to our array like this:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"

# We could have used either Array#concat or Array#push to add Dino to the family.

# How can we add multiple items to our array? (Dino and Hoppy)

flintstones.concat(["Dino", "Hoppy"])
p flintstones


#_______________________________________________________________________________
# 8) Shorten this sentence:

advice = "Few things in life are as important as house training your pet dinosaur."

# ...remove everything starting from "house".

advice.slice!(0, 39)

#____bonus_______________

advice[0, 39]

#_____launch_solution_____

#advice.slice!(0, advice.index('house'))

#_______________________________________________________________________________
# 9) Write a one-liner to count the number of lower-case 't' characters in the
#    following string:

statement = "The Flintstones Rock!"

statement.count('t')


#_______________________________________________________________________________
# 10) Back in the stone age (before CSS) we used spaces to align things on the
# screen. If we had a 40 character wide table of Flintstone family members, how
# could we easily center that title above the table with spaces?

title = "Flintstone Family Members"

title.center(40)
