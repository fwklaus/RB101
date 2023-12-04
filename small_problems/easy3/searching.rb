puts "Enter the 1st number:"
int = gets.chomp.to_i

puts "Enter the 2nd number:"
int2 = gets.chomp.to_i

puts "Enter the 3rd number:"
int3 = gets.chomp.to_i

puts "Enter the 4th number:"
int4 = gets.chomp.to_i

puts "Enter the 5th number:"
int5 = gets.chomp.to_i

puts "Enter the last number:"
int6 = gets.chomp.to_i

arr = [int, int2, int3, int4, int5]

case 
when arr.include?(int6)
  puts "The number #{int6} appears in #{arr}."
else
  puts "The number #{int6} does not appear in #{arr}"
end