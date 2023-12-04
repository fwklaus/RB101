# sum of sums
# takes array
# gets sum of sums of leading subsequences
# 
# initialize sub-array array
# iterate over array
#  from 0 to end of array
#   get sub-arrays and push to array
#     get the sum of each sub array
#       - get the sum of the array

# def sum_of_sums(arr)
#   sub_arrys = []
#   (0...arr.size).each do |stop|
#     sub_arrys << arr[0..stop]
#   end

#   sub_arrys.map do |sub_arry|
#     sub_arry.sum
#   end.sum
# end

# p sum_of_sums([3, 5, 2]) == 21
# p sum_of_sums([1, 5, 7, 3]) == 36
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

# madlibs

# puts "Enter a noun:"
# noun = gets.chomp

# puts "Enter a verb:"
# verb = gets.chomp

# puts "Enter a adjective:"
# adjective = gets.chomp

# puts "Enter a adverb:"
# adverb = gets.chomp

# puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's funny!"

# leading substrings

# def leading_substrings(str)
#   sub_strs = []

#   (0...str.size).each do |stop|
#     sub_strs << str[0..stop]
#   end

#   sub_strs
# end

# p leading_substrings('abc') == ['a', 'ab', 'abc']
# p leading_substrings('a') == ['a']
# p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# all substrings

# def leading_substrings(str)
#   sub_strs = []
#   (0...str.size).each do |stop|
#     sub_strs << str[0..stop]
#   end

#   sub_strs
# end

# # we want to initialize a new empty array
# # we want to iterate over the str - start condition
# #      - create a range from 0 to the end of the string
# #         - on each iteration call leading substrings
# #              - pass str to leading substrings
# #              - put the return value in the empty array
# #            

# def substrings(str)
#   all_subs = []

#   (0...str.size).each do |start|
#     all_subs << leading_substrings(str[start...str.size])
#   end

#   all_subs.flatten
# end

# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

# palindromic substrings

# require "pry-byebug"
# def leading_substrings(str)
#   sub_strs = []
#   (0...str.size).each do |stop|
#     sub_strs << str[0..stop]
#   end

#   sub_strs
# end

# def substrings(str)
#   all_subs = []

#   (0...str.size).each do |start|
#     all_subs << leading_substrings(str[start...str.size])
#   end

#   all_subs.flatten
# end

# # take string
# #  invoke substrings, passing str as argument
# #   - iterate over the return value
# #  check if the sub_strings are palindromes
# #       - select elements that are palindromes
# #           - check if the string is equal to the reversed string

# def is_palindrome?(str)
#   str == str.reverse
# end

# def palindromes(str)
#   str = str.downcase
#   sub_strs = substrings(str)

#   palindromes = sub_strs.select do |str|
#     is_palindrome?(str) && str.size > 1
#   end
# end

# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

# fizzbuzz

# takes two integers - starting and ending number

# def fizzbuzz(int1, int2)
#   range = (int1..int2).to_a

#   range.each do |int|
#     case 
#     when int % 3 == 0 && int % 5 == 0
#       puts "FizzBuzz"
#     when int % 3 == 0
#       puts "Fizz"
#     when int % 5 == 0
#       puts "Buzz"
#     else 
#       puts int
#     end
#   end
# end

# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# double char (part 1)
# take a string
# initialize new string
#   for each character 
#     multiply character by two
#      push to string
# return doubled string

# def repeater(str)
#   doubled_str = ''
#   str.chars.each do |char|
#     doubled_str << (char * 2)
#   end
#   doubled_str
# end

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''


# double char part 2

# takes a string
# returns new string where consonants are doubled
#   - do not double vowels, digits, punctuation, whitespace
# iterate over the str
#  if the character is anything in the alphabet, except 
#      for a vowel, double the char
#  if the char is anything else, double it

# ALPHABET = ("a".."z").to_a

# def double_consonants(str)
#   repeated_consonants = ''
#   str.chars.each do |char|
#     if ALPHABET.include?(char.downcase) && char.match?(/[^aeiou]/i)
#       repeated_consonants << (char * 2)
#     else
#       repeated_consonants << char
#     end
#   end
#   repeated_consonants
# end

# p double_consonants('String') == "SSttrrinngg"
# p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") == "JJullyy 4tthh"
# p double_consonants('') == ""

# reverse the digits in a number
# takes a positive integer
# returns number with digits reversed

# def reversed_number(int)
#   int.digits.join.to_i
# end


# p reversed_number(12345) == 54321
# p reversed_number(12213) == 31221
# p reversed_number(456) == 654
# p reversed_number(12000) == 21 # No leading zeros in return value!
# p reversed_number(12003) == 30021
# p reversed_number(1) == 1

# get the middle character

# takes a non-empty string
# returns middle character or characters of the argument
# return one character if argument has odd length
# return two characters if argument has even length
require "pry-byebug"

def center_of(str)
  if str.size.odd?
    middle = (str.size)/2
    str[middle]
  else
    middle_floor = ((str.size)/2) - 1
    middle_ceil = (str.size)/2
    str[middle_floor..middle_ceil]
  end
 end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
