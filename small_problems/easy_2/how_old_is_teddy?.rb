# Build a program that randomly generates and prints Teddy's age. To get the
# age, you should generate a random number between 20 and 200.

def get_teddys_age(name = "Teddy")
  age = (20..200).to_a.sample
  puts "#{name} is #{age} years old!"
end

get_teddys_age("Tommy")


#______________launch_solution__________________________

age = rand(20..200)
puts "Teddy is #{age} years old!"

