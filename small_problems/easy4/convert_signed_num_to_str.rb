=begin
PROBLEM:extend previous method

input: integer
output: string
mutating?:

rules:
   -explicit:
     - takes an integer
     - returns string
          - with appropriate sign

     - do not use standard conversion methods     
   -implicit:
     
unclear parts of problem?:

examples/test_cases:


data/alg:
- 

=end



CONVERSION = { 0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4",
  5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9
  "  }

def integer_to_string(num)
  str = []

  num.digits.each do |num|
    str.unshift(CONVERSION[num])
  end
  str.join
end

def signed_integer_to_string(int)
  if int > 0
    "+#{integer_to_string(int)}"
  elsif int < 0 
    "-#{integer_to_string(int.abs)}"
  else
    "0"
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'