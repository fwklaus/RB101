# Input: get length and width of a room(integers)
# Output: displays area of the room in both square meters and square feet

# Rules:
#   -explicit:
#       -get length and width of room from user
#       -length and width of room are in meters
#       -do not worry about validating input

#  -implicit:
#       - need to convert inputs to floats to perform accurate multiplication 
#         operation

## DataStructures/Algorithm:
# - prompt user for length of room in meters
# - get length of room in meters (to_i)
# - prompt user for width of room in meters
# - get width of room in meters (to_i)
# - get area of room in meters (width times length)
# - convert area of room to feet (to_f)
# 
=begin

SQFEET = 1
SQMETER_TO_SQFEET = SQFEET * 10.7639

puts "Enter the length of the room in meters:"
length = gets.chomp.to_i

puts "Enter the width of the room in meters:"
width = gets.chomp.to_i

area_in_meters = (length * width).to_f
area_in_feet = area_in_meters * SQMETER_TO_SQFEET

puts "The area of the room is #{area_in_meters} square_meters (#{format("%.2f",area_in_feet)})."

=end
#Further Exploration____________________________________________________________
# ask for input measurements in feet
# display results in square feet, square inches, square centimeters

## DataStructures/Algorithm:
# get length of room in feet
# get width of room in feet
# get area of room in feet (length by width)

# area in centimeters:
#    convert square 


SQINCHES_TO_SQUAREFOOT = 144

SQMETER_TO_SQFEET = 10.7639

SQCENTIMETERS_TO_SQINCH = 6.4516



puts "Enter the length of the room in feet:"
length = gets.chomp.to_i

puts "Enter the width of the room in feet:"
width = gets.chomp.to_i


area_in_feet = (length * width).to_f
area_in_inches = area_in_feet * SQINCHES_TO_SQUAREFOOT
area_in_centimeters = area_in_inches * SQCENTIMETERS_TO_SQINCH



puts "The area of the room is #{format("%.2f", area_in_feet)} square feet, #{format("%.2f", area_in_inches)} 
  square inches, and #{format("%.2f", area_in_centimeters)} square centimeters."
