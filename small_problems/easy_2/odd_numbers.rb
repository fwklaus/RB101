# Print all odd numbers from 1 to 99, inclusive, to the console, with each
# number on a separate line.

odd_arr =[]
count = 1

while count < 100
  odd_arr.push(count) if count.odd?
  count += 1
end

odd_arr.each{|num| puts num}

#____________launch_solution_____________________

value = 1
while value <= 99
  puts value
  value += 2
end

#____________repeat_with_different_techniques______


puts (1..99).select(&:odd?)

for odd in 1..99
  puts odd if odd.odd?
end


