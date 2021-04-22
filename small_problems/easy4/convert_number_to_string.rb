# Write a method that takes a positive integer or zero, and converts it to a
# string representation.

NUMBERS = { 0 => "0",
            1 => "1",
            2 => "2",
            3 => "3",
            4 => "4",
            5 => "5",
            6 => "6",
            7 => "7",
            8 => "8",
            9 => "9" }

def integer_to_string(int)
   int.digits.reverse.each_with_object([]){ |num, memo| memo << NUMBERS.fetch(num)}.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'


#__launch__solution_______

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

