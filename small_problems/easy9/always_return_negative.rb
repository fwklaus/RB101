# Input: integer
# Output: integer 

# Rules:
#   -Explicit:
#      -takes a number
#      -if argument is positive, return negative of that number
#      -if argument is 0 or negative, return original number

def negative(int)
  int > 0 ? -int: int
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby