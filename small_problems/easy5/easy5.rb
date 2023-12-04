# ascii string value

# takes string
# split string to chars - chars
# - convert chars to ascii values - map
#  - sum values

# def ascii_value(str)
#   str.chars.map do |char|
#     char.ord
#   end.sum
# end

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0

# after midnight part 1

# if time is positive, after midnight
# if time is negative, before midnight
# return "00:00" if time is 0
# takes time as integer - in minutes
# returns the time of day in 24 hour format (hh:mm) - string

# take time
# normalize values
#   - create constant for minutes in a day
#     - if time is positive
#           - subtract minutes per day until time is between 0 and 1439
#     - if time is negative
#           - add minutes per day until time is between 0 and 1439
#   once time is normalized
#      - divide the minutes by minutes per hour - divmod
#          - the result is our hours and the remainder is our minutes

# MINUTES_PER_DAY = 1440

# def normalize_time(time)
#   if time > 0 && time > MINUTES_PER_DAY
#     until time. between?(0, MINUTES_PER_DAY)
#       time -= MINUTES_PER_DAY
#     end
#   elsif time < 0 
#     until time.between?(0, MINUTES_PER_DAY)
#       time += MINUTES_PER_DAY
#     end
#   end
#   time
# end

# def time_of_day(time)
#   time = normalize_time(time)
#   hours, minutes = time.divmod(60)

#   format(%(%02d:%02d),hours, minutes)
# end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"


# after midnight part 2


# take time in 24 hour format
#  - return number of minutes before/after midnight

# split time into hours and minutes - split(':')
# convert hours to minutes, add to minutes
#       hours * 60
# return time in minutes

# MINUTES_PER_HOUR = 60
# MINUTES_PER_DAY = 1440

# def after_midnight(str_time)
#   hours, minutes = str_time.split(':')
#   time = (hours.to_i * MINUTES_PER_HOUR) + minutes.to_i  
#   time == MINUTES_PER_DAY ? 0 : time
# end

# def before_midnight(str_time)
#   hours, minutes = str_time.split(':')
#   time = (hours.to_i * MINUTES_PER_HOUR) + minutes.to_i  
#   time == 0 ? 0 : MINUTES_PER_DAY - time
# end



# p after_midnight('00:00') == 0
# p before_midnight('00:00') == 0
# p after_midnight('12:34') == 754
# p before_midnight('12:34') == 686
# p after_midnight('24:00') == 0
# p before_midnight('24:00') == 0

# letter swap

# take string
# return string

# swap first and last letters of each word
# assume:
#    each word contains at least one letter
#    each string contains at least one word
#    each string contains only words and spaces

# split string to array
# if word is greater than 1 letter long
#      - swap first and last letter


# def swap(str)
#   str.split(' ').map do |word|
#     word[0], word[-1] = word[-1], word[0] if word.size > 1
#     word
#   end.join(' ')
# end


# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'

# clean up the words

# takes a string
#   - all lowercased
# return string with all non-alphabetic letters replaced by spaces
#   - reult should never have consecutive spaces
#   - if multuiple spaces in a row, remove consecutive spaces

# take string
#   substitute all non-alphabetic strings with a space - gsub
#   remove consecutive spaces - squeeze

# def cleanup(str)
#   str.gsub(/[^a-z]/, ' ').squeeze(' ')
# end


# p cleanup("---what's my +*& line?") == ' what s my line '

# letter counter part 1

# takes a string with one or more space seperated words
# returns hash
#   - numbers of words of different sizes
# words are any string of characters that do not include a space

# def word_sizes(str)
#   hsh = Hash.new(0)
#   str.split(' ').each do |word|
#     hsh[word.size] += 1
#   end
#   hsh
# end

# def word_sizes(str)
#   str.split(' ').each_with_object({}) do |word, hsh|
#     hsh.include?(word.size) ? hsh[word.size] += 1 : hsh[word.size] = 1
#   end  
# end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}

# letter counter part 2
# # exclude non-letters when determining word size

# def word_sizes(str)
#   str = str.split.map do |word|
#     word.gsub(/[^a-z]/i, '')
#   end

#   str.each_with_object({}) do |word, hsh|
#     hsh.include?(word.size) ? hsh[word.size] += 1 : hsh[word.size] = 1
#   end  
# end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# p word_sizes('') == {}

# alphabetical numbers

# sort number based on English word for each number

# how do we get the enlish word for each number
#  - create an array with each word at the appropriate index
#  - we'll sort the array by the string representation of each number
# 

# ALPHABET = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

# def alphabetic_number_sort(arr)
#   arr.sort_by do |num|
#     ALPHABET[num]
#   end
# end

# p alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

# ddaaiillyy  ddoouubbllee

# takes a string
# returns new string
#   - value of original string with all consecutive characters collapesed
#       into single digits
#        - no String#squeeze


# take string
#  create new string
#   interate over string
#     if prvious letter in string is the same as current letter
#        go to next iteration
#     otherwise, add the letter to the string

# def crunch(str)
#   new_str = []

#   str.chars.each_with_index do |char, idx|
#     if new_str.empty?
#       new_str << char
#     else
#       new_str.last == char ? next : new_str << char
#     end
#   end
#   new_str.join
# end


# p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# p crunch('4444abcabccba') == '4abcabcba'
# p crunch('ggggggggggggggg') == 'g'
# p crunch('a') == 'a'
# p crunch('') == ''

# bennerizer

def print_in_box(txt)
  first_and_last = "+-#{"-" * txt.size}-+"
  second_and_fourth = "| #{' ' * txt.size} |"
  middle = "| #{txt} |"

  puts first_and_last
  puts second_and_fourth
  puts middle
  puts second_and_fourth
  puts first_and_last
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')


