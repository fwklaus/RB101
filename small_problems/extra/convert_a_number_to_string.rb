require "pry"
# PROBLEM: takes an integer, converts it a signed string representation

# input: integer
# output: string
# mutating?: no

# rules:
#    -explicit:
#       - takes an integer
#        - converts it to a string representation
#        - cannot use standard conversion methods
#    -implicit:
#      
# unclear parts of problem?:

# examples/test_cases:


# data/alg:
#  - takes an integer
#  - converts integer to string
#      - create an array of strings
#      - save number to int modulo 10
#          - add the number to the num variable
#          - multiply the variable by 10 

#           
#      - return string
#    - prepend symbol to string based on initial value of input

#  - returns signed integer based on the input


def convert_int_to_str(int)
  int = int.abs if int < 0
  numbers = %w(0 1 2 3 4 5 6 7 8 9)
  num = []
  
  (int.digits.size).times do |_|
    last = int % 10
    num.unshift(numbers[last])
    int /= 10
  end

  num.join
end

def signed_integer_to_string(int)
  if int > 0
    "+#{convert_int_to_str(int)}"
  elsif int < 0
    "-#{convert_int_to_str(int)}"
  else
    convert_int_to_str(int)
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'