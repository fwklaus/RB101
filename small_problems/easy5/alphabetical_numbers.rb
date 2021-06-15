# Write a method that takes an Array of Integers between 0 and 19, and returns
# an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven,
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen
=begin
NUMBER = { 0 => 'zero',
           1 => 'one',
           2 => 'two',
           3 => 'three',
           4 => 'four',
           5 => 'five',
           6 => 'six',
           7 => 'seven',
           8 => 'eight',
           9 => 'nine',
           10 => 'ten',
           11 => 'eleven',
           12 => 'twelve',
           13 => 'thirteen',
           14 => 'fourteen',
           15 => 'fifteen',
           16 => 'sixteen',
           17 => 'seventeen',
           18 => 'eighteen',
           19 => 'nineteen' }

def alphabetic_number_sort(array)
  sorted_array = array.each_with_object([]) do |num, memo|
    memo << NUMBER.fetch(num)
  end
  sorted_array.sort.map { |string_num| NUMBER.key(string_num) }
end
  
p alphabetic_number_sort((0..19).to_a)  == [
8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
6, 16, 10, 13, 3, 12, 2, 0
]


#_launch_solution____


NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end

=end


# input: array 
# output: array (integers sorted based on english word for number)

# rules:
#  -explicit:
#      -takes an array of integers between 0 and 19
#      -returns an array of the same integers sorted by their english name

# create num word array - zero to nineteen
# sort arr by word representations - sort_by



NUM_WORD_ARRAY = %w(zero one two three four five six seven eight nine
ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)


def alphabetic_number_sort(arr)
  arr.sort_by do |word|
    NUM_WORD_ARRAY[word]
  end
end




p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]


