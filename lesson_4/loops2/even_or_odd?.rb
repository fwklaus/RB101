# Write a loop that prints numbers 1-5 and whether the number is even or odd.

count = 1

loop do
  break if count > 5
  odd_or_even = count.odd? ? "odd" : "even"
  puts "#{count} is #{odd_or_even}!"
  count += 1
end

