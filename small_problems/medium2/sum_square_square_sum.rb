# input: integer
# output: integer

# rules:
#   -explicit:
#      - compute difference between:
#               -square of the sum of 1 to n(input)
#               -sum of the sqauares of 1 to n(input)
#      

# DataStructures/Algorithm:
# - array
# - upto
# - sum
#
# - create array from 1 to n
# - sum array, and square array
# - subtract the array 
# - from 1 to n(input), sum the integers
# - from summed and squared array, subtract
#   same array where ever element is squared, and then array is summed



def sum_square_difference(int)
  sum_arr = []
  squared_arr = []
  
  1.upto(int){ |i| sum_arr << i }
  1.upto(int){ |i | squared_arr << i**2 }
  
  (sum_arr.sum)**2 - squared_arr.sum 
  
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150



 