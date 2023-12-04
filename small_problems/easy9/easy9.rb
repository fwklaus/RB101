# welcome stranger

# def greetings(arr, hsh)
#   "Hello, #{arr.join(' ')}! Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
# end

# p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) == "Hello, John Q Doe! Nice to have a Master Plumber around."


# double doubles

# takes integer
# returns integer 2 times the input
#   - unless the argument is "double number"
#         - return double numbers as-is
# double-number: even number of digits whose left and right side digits are
#                 exactly the same

# def double_number?(int)
#   if int.to_s.size.even?
#     half = int.to_s.size / 2
#     first_half = int.to_s[0..half - 1]
#     second_half = int.to_s[half..]
#     first_half == second_half
#   else
#     false
#   end
# end

# def twice(int)
#   return int if double_number?(int)
#   int * 2
# end

# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

# always return negative
# takes int
# if argument is positive, return negative of that num
# if number is 0 or negative, return the original num

# def negative(int)
#   return int if int <= 0
#   -int
# end

# p negative(5) == -5
# p negative(-3) == -3
# p negative(0) == 0      # There's no such thing as -0 in ruby

# counting up
# takes integer
# returns array between 1 and the argument

# def sequence(int)
#   (1..int).to_a
# end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]

# uppercase check
# ignore letters that are non alphabetic
# UPPERCASE = ("A".."Z").to_a
# LOWERCASE = ("a".."z").to_a

# def uppercase?(str)
#   val = str.delete("^a-zA-Z").chars.all? do |char|
#     UPPERCASE.include?(char)
#   end
# end

# p uppercase?('t') == false
# p uppercase?('T') == true
# p uppercase?('Four Score') == false
# p uppercase?('FOUR SCORE') == true
# p uppercase?('4SCORE!') == true
# p uppercase?('') == true

# how long are you?

# takes a string 
# returns an array containing every word from the string with word length and space appended

# def word_lengths(str)
#   str.split(' ').map do |word|
#     "#{word} #{word.size}"
#   end
# end

# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# p word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# p word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]

# p word_lengths("") == []

# name swapping

# def swap_name(str)
#   str_arr = str.split(' ')
#   "#{str_arr.last}, #{str_arr.first}"
# end

# p swap_name('Joe Roberts') == 'Roberts, Joe'

# sequence count

# def sequence(count, step)
#   seq = []
#   1.upto(count) do |i|
#     seq << i * step
#   end
#   seq
# end

# p sequence(5, 1) == [1, 2, 3, 4, 5]
# p sequence(4, -7) == [-7, -14, -21, -28]
# p sequence(3, 0) == [0, 0, 0]
# p sequence(0, 1000000) == []

# grade book

# def get_grade(int1, int2, int3)
#   avg = [int1, int2, int3].sum / 3

#   case avg
#   when 90..100 then "A"
#   when 80..89  then "B"
#   when 70..79  then "C"
#   when 60..69  then "D"
#   else
#     "F"
#   end
# end

# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"

# grocery list

# def buy_fruit(arr)
#   grocery_list = []
#   arr.each do |fruit, number|
#     number.times { |_| grocery_list << fruit }
#   end

#   grocery_list
# end

# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]

# group anagrams

# takes array of strings
# outputs array of arrays 
#    - each sub_array is full of anagrams

# takes an array
#  - initialize hash
#  - iterates over the array
#      - sorts each word
#          - checks if the word exists in the hash
#              - if it does, add the word to values array
#              - otherwise, initialize the new key: value pair
# 

# def group_anagrams(arr)
#   hsh = {}

#   arr.each do |word|
#     if hsh.has_key?(word.chars.sort.join)
#       hsh[word.chars.sort.join] << word
#     else
#       hsh[word.chars.sort.join] = [word]
#     end
#   end

#   hsh.values.each do |anagrams|
#     p anagrams
#   end
# end

# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#   'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#   'flow', 'neon']

# group_anagrams(words)
