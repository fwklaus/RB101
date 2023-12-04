puts "Enter the length of the room in meters:"
length = gets.chomp.to_i

puts "Enter the width of the room in meters:"
width = gets.chomp.to_i

sq_meters = length * width

SQ_FEET = 1
SQ_FOOT_TO_METER = SQ_FEET * 10.7639
sq_feet = SQ_FOOT_TO_METER * sq_meters 

puts "The area of the room is #{format("%.01f", sq_meters.round(2))} square meters (#{sq_feet.round(2)} square feet)"