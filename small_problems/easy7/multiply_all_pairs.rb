# Input: two arrays (list of numbers)
# Output: new array (contains product of every possible pair of elemnts in 
#                    the arrays)

# Rules:
#    -Explicit:
#        - takes two arrays 
#              - contain list of integers
#        - multiplies every pair of numbers formed between elements of both arrays
#        - returns results of operation in new array
#              - results sorted in ascending order
#        - assume neither argument is empty array
#        - array lenghts not required to be the same length
#     

# Data Structures/Algorithm:
#  - takes two arrays containing lists of integers
##### looping algorithm #######
#  - initialize empty result array - array
#  - initialize empty index variable
#  - loop over the first array - loop
#        - initalize index variable for second array
#        - loop over second array
#              - multiply element at array 1 index by array 2 index
#                         -store result in result_array
#              - increment second index count by 1
#              - ...  
#              - end loop when second index count is equal to second array length
#        - increment index variable for array 1 by 1
#        - ...
#        - end loop when first index is equal to length of first array
###############################
#  - sort the array
#  - return sorted array
=begin

def multiply_all_pairs(arr1, arr2)
  result_arr = []
  index1 = 0
  loop do 
    break if index1 == arr1.size
    index2 = 0
    loop do
      break if index2 == arr2.size
      result_arr << arr1[index1] * arr2[index2]
      index2 += 1
    end
    index1 += 1
  end
  result_arr.sort
end

=end


#_refactor_with_each

def multiply_all_pairs(arr1, arr2)
  result_arr = []
  arr1.each do |ele1|
    arr2.each do |ele2|
      result_arr << ele1 * ele2  
    end
  end
  result_arr.sort
end


p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

#_launch_compact_solution

def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
end