# input: string(of digits)
# output: integer(with sign)

# rules:
#   -explicit:
#       - takes a string of digits
#       - returns appropriate number as integer
#                  -if leading char is negative return negative
#                  -if leading char is positive return positive
#                  -no sign, return a positive number
#       - assume the string will always contain a valid number
#       - do not use any standard ruby coversion methods
#       - can use method from previous lesson

## DataStructures/Algorithm:
# - takes string

# - if number is negative append a negative sign
# - if number is positive number has no sign
# - convert string to integer


def string_to_signed_integer(str)
  numbers = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
  '7' => 7, '8' => 8, '9' => 9 }
  
  result = if str.start_with?('-') || str.start_with?('+')
    str[1..].chars.inject(0) do |sum, int|
      sum *= 10
      sum += numbers[int]
    end
  else
      str.chars.inject(0) do |sum, int|
      sum *= 10
      sum += numbers[int]
    end
  end

  str.start_with?('-') ? -result : result 
end



p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100


NUMBERS = {  0 => '0',
             1 => '1',
             2 => '2',
             3 => '3',
             4 => '4',
             5 => '5',
             6 => '6',
             7 => '7',
             8 => '8',
             9 => '9' }
             
def integer_to_string(int)
  int.digits.reverse.each_with_object([]){ |num, memo| memo << NUMBERS.fetch(num)}.join
end

def signed_integer_to_string(int)
  if int < 0 
    '-' + integer_to_string(int.abs)
  elsif int > 0   
    '+' + integer_to_string(int)
  else
    integer_to_string(int)
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

#_launch_solution________

def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end
=end