# Write a method that takes a String of digits, and returns the appropriate
# number as an integer

def string_to_integer(str)
  numbers = { "0" => 0,
              "1" => 1,
              "2" => 2,
              "3" => 3,
              "4" => 4,
              "5" => 5,
              "6" => 6,
              "7" => 7,
              "8" => 8,
              "9" => 9 }
              
  int_array = str.split(//).each_with_object([]) do |idx, memo|
    memo << numbers.fetch(idx)
  end
  
  int_array.inject(0){|memo, idx| (memo * 10) + idx }
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570


#___launch_soluion_____

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

#___further_exploration_____




