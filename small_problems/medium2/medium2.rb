require "pry-byebug"
# longest sentence

# prints the longest sentence in the file based on word count
# sentences may end with - . ! ?
# any sequence of chars that are not spaces or sentene ending chars
#  are a word
# also print the number of words in the longest sentece

# external_file = File.read("example.txt")


# def longest_sentence(file)
#   file = file.split(/[!.?]/)
  
#   longest_sentence = file.max_by do |sentence|
#     sentence.split.size
#   end

#   "#{longest_sentence}: #{longest_sentence.split.size} words."
# end


# puts longest_sentence(external_file)

# Now I know my ABCs

# write a method that returns true if the input can be spelled with the blocks


# def block_word?(word)
#   blocks = %(BO GT VI XK RE LY DQ FS ZM CP JW NA HU)
#   size = blocks.split.size
#   word = word.upcase
#   new_word = ''

#   word.chars.each do |letter|
#     if blocks.include?(letter)
#       new_word << letter
#       blocks.sub!(letter, '')     
#     end
#   end

#   new_word == word.upcase && blocks.split.size == size
  
# end

# p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true

# lettercase percentage ration

# def letter_percentages(str)
#   hsh = {lowercase: 0, uppercase: 0, neither: 0}

#   str.each_char do |char|
#     case char
#     when "A".."Z" then hsh[:uppercase] += 1
#     when "a".."z" then hsh[:lowercase] += 1
#     else
#       hsh[:neither] += 1
#     end
#   end

#   ret = hsh.each_pair do |style, percentage|
#     per = (percentage / (str.size).to_f) * 100 
#     hsh[style] = per
#   end

#   hsh
# end

# p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }


# matching parentheses?


# def balanced?(str)
#   balanced = 0
#   str.delete("^()").chars.each do |char|
#     return false if char == ')' && balanced <= 0
#     case char
#     when "(" then balanced += 1
#     when ")" then balanced -= 1
#     end
#   end
#   balanced.zero?
# end



# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false


# triangle sides
# valid if:
#     -sum of the lengths of the two shortest sides must be greater than the length of the longest side
#     - all sides must have lengths greater than 0


# def is_valid?(arr)
#   arr = arr.sort
#   arr[0..1].sum > arr[2] &&
#   arr.all? { |sides| sides > 0 }
# end

# def determine_triangle(arr)
#   case arr.uniq.size
#   when 1 then :equilateral
#   when 2 then :isosceles
#   when 3 then :scalene
#   end
# end

# def triangle(s1, s2, s3)
#   return :invalid if !is_valid?([s1,s2,s3])

#   determine_triangle([s1,s2,s3])
# end


# puts triangle(3, 3, 3) == :equilateral
# puts triangle(3, 3, 1.5) == :isosceles
# puts triangle(3, 4, 5) == :scalene
# puts triangle(0, 3, 3) == :invalid
# puts triangle(3, 1, 1) == :invalid

# tri-angles

# valid triangle:
#     - sum of angles must be esactly 180 degrees
#     - all angles must be greater than 0


# def is_valid?(arr)
#   sum = arr.sum
#   sum == 180 && arr.all? { |angles| angles > 0 }
# end

# def get_triangle(arr)
#   case
#   when arr.any? { |side| side == 90 }      then :right
#   when arr.all? { |angles| angles < 90 }   then :acute
#   when arr.count { |side| side > 90 } == 1 then :obtuse
#   end
# end

# def triangle(ang1, ang2, ang3)
#   return :invalid if !is_valid?([ang1, ang2, ang3])

#   get_triangle([ang1, ang2, ang3])
# end


# puts triangle(60, 70, 50) == :acute
# puts triangle(30, 90, 60) == :right
# puts triangle(120, 50, 10) == :obtuse
# puts triangle(0, 90, 90) == :invalid
# puts triangle(50, 50, 50) == :invalid

# unlucky days
# returns the number of Friday the 13ths in a given year
# assum the year is greater than 1752

# require "date"

# def friday_13th(year)
#   count = 0
  
#   (1..12).each do |month|
#     day = Date.new(year,month,13)
#     if day.friday?
#       count += 1
#     end
#   end
#   count
# end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

# next featured number higher than a given value

# a featured number is an odd number that is a multiple of 7
#  and whose digits occur exactly once each

# takes a single integer
# returns the next featured number greater the argument

# starting at the input
# -create a range from int to the highest possible num
#   -increment value by 1 on each iteration
#    -check if value is divisible by 7 and if digits occur exactly once
#     each
#       break out of loop when first number is encountered
#         return the number


# def unique_digits?(int)
#   number_of_digits = int.to_s.chars.size
#   number_of_digits == int.to_s.chars.uniq.size &&
#   int.odd?
# end


# def featured(int)
#   ((int + 1)..9_999_999_999).each do |num|
#     return num if num % 7 == 0 && unique_digits?(num)
#   end
# end

# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

# p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# bubble sort

# on each pass compare consecutive elements
# if the first is greater than the seocnd, swap
# the process ends when a complete pass is made without performing any
#   swaps, at which point the array is completely sorted


# create an outer loop
#  create a flag variable to signal whether a swap has been made
#    - initialize to false
# iterate over the arr -each with index
#   compare the current element to the next element
#    if the current element is greater than index + 1 element
#      parallel assign the elements 
#         - reassign flag to true
#     break if the next element is nil
#   return the sorted array

# def bubble_sort!(arr)
#   swapped = nil
#   loop do
#     break if swapped == false
#     swapped = false
#     arr.each_with_index do |el, idx|
#       break if arr[idx + 1].nil?
#       if el > arr[idx + 1]
#         arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
#         swapped = true
#       end
#     end
#     break if swapped == false
#   end
#   arr
# end

# p array = [5, 3]
# p bubble_sort!(array)
# p array == [3, 5]

# p array = [6, 2, 7, 1, 4]
# p bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# p bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# sum square - square sum

# computes the difference between the square of the sum of the first
#   n positive integers
#     - and the sum of the sqare of the first n positive integers

# gets the sum integers, squares the sum
# squares each of the integers, gets the sum


# def sum_square(int)
#   sum_square = 0
#   (1..int).each { |i| sum_square += i }
  
#   sum_square ** 2
# end

# def square_sum(int)
#   square_sum = 0
#   (1..int).each do |i|
#     square_sum += (i ** 2)
#   end

#   square_sum
# end

# def sum_square_difference(int)
#   sum_square = sum_square(int)
#   square_sum = square_sum(int)

#   sum_square - square_sum
# end

# p sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# p sum_square_difference(10) == 2640
# p sum_square_difference(1) == 0
# p sum_square_difference(100) == 25164150