# Print all even numbers from 1 to 99, inclusive, to the console, with each
# number on a separate line.

99.times do |num|
   next if num < 1 
   puts num if num.even?
end

#____________launch_solution________

value = 1
while value <= 99
  puts value if value.even?
  value += 1
end


