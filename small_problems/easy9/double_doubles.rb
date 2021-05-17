# Input: integer
# Output: integer(double the argument, unless arg is a double number)

# Rules:
#   -Explicit:
#       -takes a number(integer)
#       -doubles the number
#          -unless argument is a double number already
#            -double number: even number of digits, left side digits are
#             the same as right side digits
#       -return the number(return double numbers as-is)

# Data Structures/Algorithm
#  -take number(integer)
#  -save integer converted to string to a variable
#  -if string length is even
#     -set middle to string length divided by 2
#     -set first half variable(beginning of string to middle)
#     -set second hald variable(middle to end of string)
#     -compare first half and second half
#        -if halfs are identical
#          -return original number
#        -else
#          -return doubled number
#  -else
#     -return doubled number

def double_number?(string_num)
  middle = string_num.length / 2  
  first_half = string_num[0,middle]
  second_half = string_num[middle..]
  first_half == second_half ? true : false
end



def twice(number)
  string_num = number.to_s
  if string_num.length.even? 
    if double_number?(string_num)
      return number
    else
      number * 2
    end
  else
    number * 2
  end
end


p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

#_launch_solution___

def twice(number)
  string_number = number.to_s
  center = string_number.size / 2
  left_side = center.zero? ? '' : string_number[0..center - 1]
  right_side = string_number[center..-1]

  return number if left_side == right_side
  return number * 2
end

