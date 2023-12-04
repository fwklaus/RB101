require 'pry'
# Write a method that takes a year as input and returns the century. The #return value should be a string that begins with the century number, and #ends with st, nd, rd, or th as appropriate for that number##.

# #New centuries begin in years that end with 01. So, the years 1901-2000 c#omprise the 20th century.#
#

=begin
PROBLEM: Convert year to century number with appropriate ending

input: integer 
output: centure (string)
mutating?:

rules:
   -explicit:
      - takes an integer -year
      - returns string
           - century number
           - ending - st, nd, rd, th
      - new centuries begin in years that end with 01
          - 1901-2000 comprise the 20th century.    
   -implicit:
     
unclear parts of problem?:

examples/test_cases:

(2000) == '20th' 
(2001) == '21st'
(1965) == '20th'
(256) == '3rd'
(5) == '1st'
(10103) == '102nd'
(1052) == '11th'
(1127) == '12th'
(11201) == '113th'

/ 100 + 1 unless year ends with 00

data/alg:
- take an integer
- to get the year
   - divide by 100
       - add 1 unless the year ends with 00
- get the ending
   - numbers that end in:
      1 - st
      2 - nd
      3 - rd
      4-9-th

      - except for 11, 12, 13 - th


=end

# def get_ending(edng)
#   return "th" if [11,12,13].include?(edng % 100)
  
#   case edng % 10
#   when 1 then 'st'
#   when 2 then 'nd'
#   when 3 then 'rd'
#   else
#     'th'
#   end
# end

# def century(year)
#   cen = year / 100
#   cen += 1 unless year % 100 == 0
#   ending = get_ending(cen)
#   cen.to_s + ending
# end

# p century(2000) == '20th'
# p century(2001)== '21st'
# p century(1965)== '20th'
# p century(256)== '3rd'
# p century(5)== '1st'
# p century(10103)== '102nd'
# p century(1052)== '11th'
# p century(1127)== '12th'
# p century(11201)== '113th'

# convert num to string!

# Write a method that takes a positive integer or zero, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

=begin
PROBLEM:

input: integer
output: string (representation of integer)
mutating?: no

rules:
   -explicit:
      - takes an integer
           - poositive or zero
      - returns string
           - representation of integer
      - do not use standard conversion methods
    
   -implicit:
     
unclear parts of problem?:

examples/test_cases:


data/alg:
- validate input
- create empty return string variable
- create conversion array
- start a loop
  - on each iteration remove a number from the integer
  - convert the number to string using array
  - prepend the number to the output string

=end

# ARRAY = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

# def integer_to_string(int)
#   return '0' if int.zero?
#   str = ''

#   loops = int.digits.size
#   loops.times do |_|
#     str += ARRAY[int % 10]
#     int /= 10
#   end


#   str.reverse
# end

# p integer_to_string(4321) == '4321'
# p integer_to_string(0) == '0'
# p integer_to_string(5000) == '5000'

# fibonacci number location by lenghth

# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

=begin
PROBLEM:

input: integer
output: integer
mutating?:

rules:
   -explicit:
     - take integer
         - specifies the size of the number we're looking for
     - return integer
         - index of the first fib number that has n digits
    
   -implicit:
     
unclear parts of problem?:

examples/test_cases:


data/alg:
create a loop 
  - return the count(index) when we've reached the number
    in the fibonacci sequence with n digits

=end

# def find_fibonacci_index_by_length(int)
#   first, second = 1, 1

#   idx = 3
#   loop do
#     first, second = second, first + second
#     return idx if second.to_s.size == int
#     idx += 1
#   end
# end

# p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# p find_fibonacci_index_by_length(3) == 12        # 1 1 2 3 5 8 13 21 34 55 89 144
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847


# reverse array (part1)

# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

=begin
PROBLEM:

input: array
output: same array
mutating?: yes

rules:
   -explicit:
      - takes an array
      - return array
          - reverses in place
      - do not use built-in reverse method
    
   -implicit:
     
unclear parts of problem?:

examples/test_cases:


data/alg:

- take an array as an argument
- iterate over hald the length of the array(times / 2)
    - on each iteration, swap elements at corresonding positions
      at start and end of array

=end

# def reverse!(arr)
#   first = 0
#   last = -1
#   (arr.size / 2).times do |_|
#     arr[first], arr[last] = arr[last], arr[first]
#     first += 1
#     last -= 1
#   end
#   arr
# end

# p list = [1,2,3,4]
# p result = reverse!(list)
# p result == [4, 3, 2, 1] # true
# p list == [4, 3, 2, 1] # true
# p list.object_id == result.object_id # true

# p list = %w(a b e d c)
# p reverse!(list) == ["c", "d", "e", "b", "a"] # true
# p list == ["c", "d", "e", "b", "a"] # true

# p list = ['abc']
# p reverse!(list) == ["abc"] # true
# p list == ["abc"] # true

# p list = []
# p reverse!(list) == [] # true
# p list == [] # true


# double char (part 2)

# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

=begin
PROBLEM: return new string where all consonants are doubled, and everything else is not doubled

input: string
output: new string
mutating?: no 

rules:
   -explicit:
      - takes a string
      - returns new string
           - all consonants are doubled
           - whitespace, vowels, puncutation
                - not doubled
    
   -implicit:
     -  case sensitive
     
unclear parts of problem?:

examples/test_cases:


data/alg:

- takes a string
- create array of letters - a..z
    - delete all vowels
- create empty string variable
- iterate over each character of the string
    - of the string is in the double_letters array
          - double it and place in new string
          - otherwise, do not double it and place in string - +=
=end


# def get_double_chars(str)
#   doubled_chars = ("a".."z").to_a
#   doubled_chars.delete_if do |char|
#     char.match?(/[aeiou]/)
#   end
# end


# def double_consonants(str)
#   double_chars = get_double_chars(str)
#   new_str = ''

#   str.each_char do |char|
#     if double_chars.include?(char.downcase)
#       new_str += (char * 2)
#     else
#       new_str += char
#     end
#   end
#   new_str
# end

# p double_consonants('String') == "SSttrrinngg"
# p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") == "JJullyy 4tthh"
# p double_consonants('') == ""

# get the middle char

# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

=begin
PROBLEM: take a string, and return the middle character(s)

input: str
output: str(char)
mutating?: no 

rules:
   -explicit:
      - takes a string
      - reutrns middle char(s) of the argument
          - if odd length, return middle char
          - if even length, return middle chars
   -implicit:
     - returns any character - spaces are valid
         - strings the length of 1 are valid
unclear parts of problem?:

examples/test_cases:


data/alg:
  - get the length of the string - size
    - if size is odd
      - slice the middle character - size / 2
    - if size is even
      - slice the middle minus 1 to middle character


=end

def center_of(str)
  half = str.size / 2

  if str.size.odd?
    str[half]
  else
    str[(half - 1)..half]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'