require "pry-byebug"
# rotation (part 1)

# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# PROBLEM: creata a new array of elements from the input, and move the first element of input array to the end of the array

# input: array
# output: new array
# mutating?: no

# rules:
#    -explicit:
#       - take an array
#       - move the first element to the end of the arary
#       - original array should not be modified
#     
#    -implicit:
#       - return a new arrray
# 
# unclear parts of problem?:

# examples/test_cases:
# [7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]

# data/alg:
# take an array
# create a new empty array
#   - iterate over the orginal array
#      - on each itereation move elements from original to new array
#      - after iteration completes move first element to the end of the 
#          new array
# - return the new array


# def rotate_array(arr)
#   new_arr = []

#   arr.each do |el|
#     new_arr << el
#   end

#   new_arr.push(new_arr.shift)
# end

# def rotate_array(arr)
#   new_arr = arr.clone
#   new_arr.push(new_arr.shift)

  
# end

# p rotate_array([7, 3, 5, 2, 9, 1])# == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# p x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true


# rotation (part 2)

# Write a method that can rotate the last n digits of a number. For example:

# Note that rotating just 1 digit results in the original number being returned.

# You may use the rotate_array method from the previous exercise if you want. (Recommended!)

# You may assume that n is always a positive integer.

# PROBLEM: writea method that rotates the last n digits of a given number

# input: two integers
# output: integer
# mutating?: no

# rules:
#    -explicit:
#       - take two integers: number to rotate, and n digits
#       - assume n is always positive
#       - return the rotated number
#           - if n is 1, return original number 
#     
#    -implicit:
#      
# unclear parts of problem?:
#   all we're doing is moving the digit n from end of number to the
#    end of the number

# examples/test_cases:
# 735291, 1 == 735291
# 735291, 2 == 735219

# data/alg:
# take integer, and n digits to rotate
# convert the number to a sring
# move the element n digits from the end of the string 
#   to the end of the string
#   convert the string back to an integer
# return the rotated integer

# def rotate_at_n(int, n)
#   int_arr = int.to_s.chars
#   int_arr.push(int_arr.slice!(-n)).join.to_i
# end

# def rotate_rightmost_digits(int, n)
#   return int if n == 1
#   rotate_at_n(int, n)
# end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917


# rotation part 3

# PROBLEM:

# input: integer
# output: integer (max rotation)
# mutating?: no

# rules:
#    -explicit:
#        - takes an integer
#        - returns a maximum rotated integer
#        - do not have to handle multiple 0s
#     
#    -implicit:
#      max rotation ends after we rotate the final two digits
#      - if the integer is a lenght of one, return the integer
# unclear parts of problem?:

# examples/test_cases:
# 735291 0   352917
# 352917 1   329175
# 329175 2   321759
# 321759 3   321597
# 321597 4   321579 6
# on each iteration we keep one more leading digit fixed in place
#   - rotate the remaining digits
#   - we only rotate the digit to the right of the fixed digit
#        - the rotated digit gets moved to the end of the integer

# data/alg:
# take the integer
#  convert to a string array
#  create a loop 
#   on each iteartion
#    fix count integers
#     for the remaingin integers, rotate 
#      save the array after each rotation
#      increment count by 1
#   break out of loop when count is equal to size of array minus 1

# def max_rotation(int)
#   return int if int.to_s.size == 1
#   int_arr = int.to_s.chars

#   count = 0

#   loop do 
#     int_arr.push(int_arr.slice!(count))
#     count += 1
#     break if count == int.to_s.size - 1
#   end
  
#   int_arr.join.to_i
# end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

# 1000 lights


# PROBLEM:

# input: integer
# output: array
# mutating?: no

# rules:
#    -explicit:
#       - takes an integer
#            - n lights, n repetitions
#       - returns an array which identifies which lights are on
#          after n repetitions
#     
#    -implicit:
#      
# unclear parts of problem?:

# examples/test_cases:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

# n lights, n repetitions

# each round we toggle the lights of current number of repetition

# data/alg:
# take n lights as an argument
# we then need to set n lights to on position
#    - initialize an empty hash with on and off keys
#    - populate the on: key with 5 integers
#  create loop in main method
#   from 1 to n
#     toggle lights
#         from int, by int, to n
#         toggle lights at int position - step
#        - check if integer is included in :on array or :off array
#           - if so, toggle the light to the other position
#                
#    - on each round toggle multples of the current value of n


# after iteration ends, return an array of lights in the on position



# def initialize_lights(n)
#   lights = { on: [], off: []}
#   1.upto(n) { |i| lights[:on] << i }
#   lights
# end

# def toggle_lights(hsh, int, n)
#   int.step(by:int, to:n) do |i|
#     if hsh[:on].include?(i)
#       hsh[:off] << hsh[:on].delete(i)
#     elsif hsh[:off].include?(i)
#       hsh[:on] << hsh[:off].delete(i)
#     end
#   end
# end

# def lights(n)
#   lights = initialize_lights(n)
  
#   2.upto(n) do |i|
#     toggle_lights(lights, i, n)
#   end
  
#   lights[:on]
# end



# p lights(5) == [1,4]
# p lights(10) == [1,4,9]


# Diamonds


# PROBLEM: display a n by n grid

# input: integer
# output: displays n by n grid
# mutating?: no

# rules:
#    -explicit:
#      - takes an integer
#          - odd integer
#              - assumed arg will always be odd
#      - displays a 4 pointed by by n grid (or diamond)
#    -implicit:
#      
# unclear parts of problem?:

# examples/test_cases:
#  *    1
# ***   3 
#  *    1

#     *      1 
#    ***     3
#   *****    5
#  *******   7
# *********  9
#  *******   7 
#   *****    5
#    ***     3 
#     *      1

# data/alg:
# take an integer
# create an empty array to store the rows
# iterate from 1 to n -odd numbers - step(by:2, to:n)
#   on each iteration push number of stars by current number
#     centered in n to the array
# create the first half of the diamond
# create the second half of the diamond

# def diamond(int)
#   rows = []

#   #first half
#   1.step(by:2, to:int) do |i|
#     rows << ('*' * i).center(int)
#   end
#   # second half
#   (int - 2).step(by:-2, to:1) do |i|
#     rows << ('*' * i).center(int)
#   end 
  
#   rows.each { |row| puts row}
# end


# diamond(1)

# # *

# diamond(3)

# #  *
# # ***
# #  *

#  diamond(9)

# #     *
# #    ***
# #   *****
# #  *******
# # *********
# #  *******
# #   *****
# #    ***
# #     *

# stack machine interpretation

# PROBLEM:

# input: string
# output: displays program
# mutating?: no

# rules:
#    -explicit:
#       - takes a program
#       - initialize register to 0
#       - all programs will be valid
#       - all operation are integer operations
#     
#    -implicit:
#      
# unclear parts of problem?:

# examples/test_cases:


# data/alg:


# def minilang(str)
#   program = str.split
#   register = 0
#   stack = []

#   program.each do |cmd|
#     case cmd
#     when "PUSH"  then stack.push(register)
#     when "ADD"   then register += stack.pop
#     when "SUB"   then register -= stack.pop
#     when "MULT"  then register *= stack.pop
#     when "DIV"   then register /= stack.pop
#     when "MOD"   then register %= stack.pop
#     when "POP"   then register = stack.pop
#     when "PRINT" then puts register
#     else
#       register = cmd.to_i
#     end
#   end
  

# end



# minilang('PRINT')
# 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)


# word to digit

# input: string
# output: string

# rules:
#  explicit:
#    - takes a string of words
#    - returns same string with any sequence of number words
#      converted to a string of digits

# split our string to an array
# iterate over the words array - each with index
#  if the sentence contains the word
#    replace every instance with the index of the word 

# NUMBER_WORDS = %w(zero one two three four five six seven eight nine)


# def word_to_digit(str)
#   NUMBER_WORDS.each_with_index do |word, idx|
#     if str.include?(word)
#       str.gsub!(/#{word}/, idx.to_s)
#     end
#   end

#  str
# end

# p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

#  Fibonacci Numbers (Recursion)

# input: integer
# output: integer

# rules:
#  - explicit:
#     -takes integer
#     - writes a recursive method that computes nth fibonacci number
#          nth is an argument to the method

# SoBuR
# - calls self at least once
# - terminating base case that stops recursion
# - uses result returned by self

# F(1) = 1
# F(2) = 1
# F(n) = F(n - 1) + F(n - 2) where n > 2

# takes integer
# create base case to end recursion
#    - base case is one



# def fibonacci(n)
#   return n if n <= 1
#   fibonacci(n - 1) + fibonacci(n - 2)
# end

# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765

# fibonacci numbers (procedural)

# rewrite recursive fibonaccy so it computes results without
#  recursion

# 1 + 1 = 2
# 1 + 2 = 3
# 2 + 3 = 5
# 3 + 5 = 8
# 5 + 8 = 13
# 8 + 13 = 21
# 13 + 21 = 34 
# 21 + 34 = 55 
# 34 + 55 = 89
# 55 + 89 = 144

# takes n
# initialize base conditions
#   - first and second numbers are 1
# create a loop
#   - on each iteration we add the first and second
#     numbers, which gives us the third number
#      - we create a temporary variable to store the result
#        - we then save the second number to the first and
#          the second number to the temporary variable
#         continue until the nth fibonacci number
#  -break out of the loop after the operation for n loop

# def fibonacci(n)
#   first = 1
#   second = 1
#   fib = 0

#   count = 2
#   loop do
#     break if count >= n
#     fib = first + second
#     first = second
#     second = fib
#     count += 1
#   end
#   fib
# end

# p fibonacci(20) == 6765
# p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001)

# fibonacci numbers (last digit)

# takes nth number of fibonacci sequence
# returns the last number of nth number

# need to get the nth digit of the sequence
# then return the last digit of the sequence



def fibonacci_last(nth)
  first, last = [1,1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last % 10
end

# puts fibonacci_last(15) == 0        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20) == 5        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100) == 5       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001) == 1  # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) == 3 # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) == 4 # -> 4