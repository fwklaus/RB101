=begin
PROBLEM:

input: positive integer
output: string
mutating?:

rules:
   -explicit:
      - takes a positive integer
      - returns a string

      - do not use standard conversion methods 
   -implicit:
     
unclear parts of problem?:

examples/test_cases:


data/alg:
- create a conversion hash
- convert string to array -digits.reverse
- iterate over number
   - convert the number and add it to return value
    - multiple result by 10
    -continue


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

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'