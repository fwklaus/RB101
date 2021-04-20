# 1) What do you expect to happen when the greeting variable is referenced in
#    the last line of the code below?
=begin
if false
  greeting = "hello world"
end

greeting

# The conditional doesn't evaluate anything. It never assigns the value to greeting.
# The variable is undefined. Nothing displays to the console
# greeting is initialized to nil because of the ininitalization within the if block

#_______________________________________________________________________________
# 2)
# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings          #  =>  outputs { a: "hi there" }

#_______________________________________________________________________________
# 3)
# In other practice problems, we have looked at how the scope of variables
# affects the modification of one "layer" when they are passed to another.
# To drive home the salient aspects of variable scope and modification of one
# scope by another, consider the following similar sets of code.

# What will be printed by each of these code groups?

# A) 

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"     # => "one is: one"
puts "two is: #{two}"     # => "two is: two"
puts "three is: #{three}" # => "three is: three"

# B)

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"     # => "one is: one"
puts "two is: #{two}"     # => "two is: two"
puts "three is: #{three}" # => "three is: three" 

# C)

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"      # => "one is: two" 
puts "two is: #{two}"      # => "two is: three "
puts "three is: #{three}"  # => "three is: one"

=end
#_______________________________________________________________________________
# 4) Ben was tasked to write a simple ruby method to determine if an input
#    string is an IP address representing dot-separated numbers. e.g. "10.4.5.11".
#    He is not familiar with regular expressions. Alyssa supplied Ben with a method
#    called is_an_ip_number? that determines if a string is a numeric string
#    between 0 and 255 as required for IP numbers and asked Ben to use it.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few
# things. You're not returning a false condition, and you're not handling the
# case that there are more or fewer than 4 components to the IP address
# (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

# Help Ben fix his code.


def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated__words.size != 4
    false
  else
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      if !(is_an_ip_number?(word))
        false 
        break
      else
        true
      end
    end
  end
end

#____launch_solution___________

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

