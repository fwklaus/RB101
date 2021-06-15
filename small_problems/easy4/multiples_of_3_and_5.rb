# Input: integer
# Output: integer (sum of multiples between 1 and number)

# rules:
#   -explicit:
#       -gets multiples of 3 and 5 between 1 and number
#       -compute the sum of the multiples 
#       -return the sum
#       -assume the argument is an integer greater than 1

## DataStructure/Algorithm
# -array
# -reduce(&:+)
# -upto 
# -if statement
# -modulo

# -create array to store multiples
# -iterate from 1 to number
# -check if current number is multiple of 3 or 5 
#    -if number is multiple of 3 or 5 
#        -append tomuleiples array
# -sum array
# -return sum


def multisum(int)
 multiples = []
 1.upto(int) do |num|
   if num % 3 == 0 || num % 5 == 0
     multiples << num
   end
end
  multiples.reduce(&:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
