# age = (20..200).to_a.sample
# puts "Teddy is #{age} years old!"


age = rand(20..200)
puts "What's your name?"
name = gets.chomp.capitalize

puts "#{name} is #{age} years old!"