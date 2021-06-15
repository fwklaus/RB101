# randomly generate age between 20 and 200
# output: string  (teddys age)

=begin
def how_old_is_teddy
  age_range = 20..200
  teddys_age = rand(age_range)
  "Teddy is #{teddys_age} years old!"  
end

p how_old_is_teddy
=end

# Further Exploration___________________________________________________________
# get name
# print age for that person
# set default name to "teddy"

puts "What's that person't name?"
name = gets.chomp

def how_old_is_teddy(name = "Teddy")
  age_range = 20..200
  teddys_age = rand(age_range)
  "#{name} is #{teddys_age} years old!"  
end

p how_old_is_teddy(name)
