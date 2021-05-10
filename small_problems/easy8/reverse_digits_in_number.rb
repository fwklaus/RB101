# Input: positive integer
# Output: positive integer(digits reversed)

# Rules:
#   -Explicit:
#       -takes a positive integer
#       -reverses digits
#       -returns reversed number
#       -don't worry about leading zeroes

#   -implicit:
#       -remove leading zeroes from reversed integer

# Data Structures/Algorithm
# -initialize reverse number variable
# -split int to array - digits
# -return reversed number

def reversed_number(int)
  reverse_num = int.digits.join.to_i
end




p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1