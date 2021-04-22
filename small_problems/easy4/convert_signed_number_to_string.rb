# Write a method that takes an integer, and converts it to a string representation.
# In this exercise, you're going to extend last exercise's method by adding
# the ability to represent negative numbers as well.


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
