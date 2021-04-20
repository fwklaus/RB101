# 1) Let's do some "ASCII Art" (a stone-age form of nerd artwork from back
#    in the days before computers had video screens).
=begin
# For this practice problem, write a one-line program that creates the
# following output 10 times, with the subsequent line indented 1 space to the
# right:

# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!


10.times{ |i| puts (' ' * i) + "The Flintstones Rock" }
#_______________________________________________________________________________
# 2) The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

# TypeError: no implicit conversion of Integer to String

#_Ways to fix_________________

# 1: 

puts "the value of 40 + 2 is " + (40 + 2).to_s

# 2: string interpolation
result = 40 + 2
puts "the value of 40 + 2 is #{result}"

#_______________________________________________________________________________
# 3) Alan wrote the following method, which was intended to show all of the factors
#    of the input number:

# solution
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 
    factors << (number / divisor) if number % divisor == 0
    divisor -= 1
  end
  factors
end


p factors(0)
 

# Alyssa noticed that this will fail if the input is 0, or a negative number,
# and asked Alan to change the loop. How can you make this work without using
# begin/end/until? Note that we're not looking to find the factors for 0 or
# negative numbers, but we just want to handle it gracefully instead of raising
# an exception or going into an infinite loop.




# Bonus 1: It tells us if a number is perfectly divisible by another number. If
#          there's no remainder following a division operation, we know the 
#          divisor is a factor of the number. Also we know if the result is an 
#          integer.

# Bonus 2: The second to last line is the return value. The method employs 
#          implicit return to return the array. Methods return the last line
#          evaluated from the method without the use of an explicit return
#          statement.
          
#_______________________________________________________________________________
# 4)
# Alyssa was asked to write an implementation of a rolling buffer. Elements
# are added to the rolling buffer and if the buffer becomes full, then new
# elements that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or + for
# modifying the buffer?". Is there a difference between the two, other than what
# operator she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end



# The use of (+) with the assignment operator(=) is non-mutating. The 
# concatenation operator(<<) is mutating. The array passed to the method is bound
# to the buffer/input_array argument in both cases. When (<<) is invoked in the method,
# the original array will also be altered. Not so for (+). Only the copy of the
# array within the method scope contains the appended element. Both methods have
# the same return value

#_______________________________________________________________________________
# 5)

# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator.
# A user passes in two numbers, and the calculator will keep computing the
# sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it, he
# got an error. Something about the limit variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# The local variable limit isn't visible to the scope of the method. For the
# method to  access limit, it must be passed in as an argument. A third argument
# must be defined for it to take the limit variable

#_______________________________________________________________________________
# 6) What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# Output: 34

#_______________________________________________________________________________
# 7) One day Spot was playing with the Munster family's home computer and he
#    wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...and before Grandpa could
# stop him, he hit the Enter key with his tail:

mess_with_demographics(munsters)

# Did the family's data get ransacked? Why or why not?

# Yes, the munsters hash is bound to the method parameter - demo_hash - and passed to the 
# method where we iterate over the values of the hash and apply destructive 
# index assignement to each family member for both the "age" and "gender" keys.
# Because the demo_hash is pointing to the original array referenced by munsters,
# index assignment affects the original array. 

#_______________________________________________________________________________
# 8) Method calls can take expressions as arguments. Suppose we define a method
#    called rps as follows, which follows the classic rules of rock-paper-scissors
#    game, but with a slight twist that it declares whatever hand was used in
#    the tie as the result of that tie.

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

# What is the result of the following call?

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# "paper"
=end

#_______________________________________________________________________________
# 9) Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the return value of the following method invocation?

p bar(foo)

# "no"