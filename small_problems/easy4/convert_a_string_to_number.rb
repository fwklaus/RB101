# input: string (of digits)
# output: integer (same digits)


# rules
#   -explicit:
#      -take a string of digits
#      -convert string to integer 
#            -do not use String#to_i, or Integer()
#      -assume all characters are numeric
#      -do not worry about leading + of -

## DataStructures/Algorithm
# - hash
# - chars
# - inject

# - create conversion hash
# - split str to array
# - iterate over str array
#     - invoke the conversion hash referencing the key of the current character
#     - store the returned result in a variable
#     - multiply the result by 10
# - return the integer 
=begin
NUMBERS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
  '7' => 7, '8' => 8, '9' => 9 }

def string_to_integer(str)
  str.chars.inject(0) do |sum, int|
    sum *= 10
    sum += NUMBERS[int]
  end
end


p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
=end

# Further Exploration___________________________________________________________
# input: hexadecimal
# output: integer

NUMBERS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
  '7' => 7, '8' => 8, '9' => 9 }

HEX = NUMBERS.merge({'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15})



def hexadecimal_to_integer(hex)
  hex.upcase!.chars.inject(0) do |accum, el|
    accum = 16 * accum + HEX[el]
  end
end


p hexadecimal_to_integer('4D9f') == 19871


# Further Exploration

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end