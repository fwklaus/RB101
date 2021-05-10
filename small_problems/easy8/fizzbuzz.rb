# Input: integers(starting number, ending number)
# Output: display combination of strings and integers depending on value

# Rules:
#   -Explicit:
#      -takes two arguments(integers): starting number, ending number
#      -print numbers between the two numbers unless number is divisible by 3 or 5
#                  - for 3, print "Fizz"
#                  - for 5, print "Buzz"
#                  - for 3 and 5, print "FizzBuzz"


# Data Structures/Algorithm
#  -takes integers(starting number, ending number)
#  -save range between two arguments to a variable
#  -initialize empty string array
#  -iterate over range - each
#      - if number is divisible by neither 3 nor 5 append to array
#      - if number is divisible by 3 - append "fizz" to array
#      - if number is divisible by 5  - append "Buzz" to array
#      - if number is divisible by 3 and 5 - append "FizzBuzz" to array
#  -join string to array. Delimit elements with commas - join(',')

def fizzbuzz(beginning, ending)
  range = (beginning..ending)
  output = []
  range.each do |int|
    if int % 3 != 0 && int % 5 != 0
      output << int
    elsif int % 3 == 0 && int % 5 == 0
      output << "FizzBuzz"
    elsif int % 3 == 0 && int % 5 != 0
      output << "Fizz"
    elsif int % 5 == 0 && int % 3 != 0
      output << "Buzz"
    end
  end
  output.join(', ')
end



p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

#_launch_solution___

def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case
  when number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end