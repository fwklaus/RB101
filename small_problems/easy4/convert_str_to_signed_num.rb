=begin
PROBLEM: 

input: string 
output: integer
mutating?: 

rules:
   -explicit:
     - takes a string
         - assume the string is always valid
         - digits 
         - may have leading or trailing sign (+/-)
     - return integer
         - if no sign is given, return a positive number

     - do not use the standard conversion methods 
     - may use thestring_to_integer method from the last lesson     
   -implicit:
     
unclear parts of problem?:

examples/test_cases:


data/alg:
- if the leading character is a +, delete it, and pass to the string_to_integer method
- if the leading character is a -, delete it, and pass to the string to integer method
     - prepend the return value with the negative sign
- otherwise, pass to string_to_integer 

=end

STRING_TO_NUM = { "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4,
                  "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9 
                }

def string_to_integer(str)
  num = 0

  str.chars do |char|
    num *= 10
    num += STRING_TO_NUM[char]
  end
  num
end

def string_to_signed_integer(str)
  case str[0]
  when "+" then string_to_integer(str[1..])
  when "-" then -string_to_integer(str[1..])
  else           string_to_integer(str)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100