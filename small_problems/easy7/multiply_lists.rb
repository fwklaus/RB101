# Input: two arrays
# Output: new array

# Rules:
#   -Explicit:
#       - takes two array
#             - arrays contain lists of numbers
#       - returns new arrray
#             - product of each pair of numbers at same index from args
#       - assume the arguments contain the same number of elements

# Are numbers floats, integers, or does it matter?

#   -Implicit:
#       - arrays appear all be integers 

# Data Structures/Algorithms:
#   - method takes two arrays of the same length
#   - initiialize new array to store multiplied values - array
#   - initialize count variable 
#   - repeatedly call each array referencing the index at count - loop
#         -multiply elements from each array at count
#         -increment count by 1 after each loop
#   - end loop when count equals array length
#   return new array

def multiply_list(arr1, arr2)
  product_arr = []
  index = 0
  loop do
    break  if index == arr1.size
    product_arr << arr1[index] * arr2[index]
    index += 1
  end
 product_arr
end



#_refactor_with_each_with_index


def multiply_list(arr1, arr2)
  product_arr = []
    arr1.each_with_index do |ele, idx|
    product_arr << ele * arr2[idx]
    end
  product_arr
end



multiply_list([3, 5, 7], [9, 10, 11])# == [27, 50, 77]