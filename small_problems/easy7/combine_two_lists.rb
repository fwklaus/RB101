# Write a method that combines two Arrays passed in as arguments, and returns
# a new Array that contains all elements from both Array arguments, with the
# elements taken in alternation.

# Input: two arrays
# Output: array(alternating elements from arrays passed in)

# Rules:
#   Explicit:
#      - takes two arrays
#      - combines arrays
#      - returns array alternating combined elements from passed arrays
#      - assume passed arrays are non-empty
#      - assume passed arrays are the same length

#   Implicit:
#      - arrays are not necessarily the same object tyoe


#   Data Stucture/Algorithm:
#      - loop
#      - array

#      - initialize empty array
#      - loop over input arrays
#             -assign first element of first array to new _arr
#             -assign first element of second array to new_arr
#             -assign second element of first array to new_arr
#             -assign second element of second array to new_arr
#             -...stop looping when first and second array are both nil
#      - return new array


#  loop algorithm
#     - initialize empty array 
#     - initialize count variable
#     - start loop
#         - on each iteration call arr[count] on both arrays
#         - append referenced value to new array
#         - increment count by one
#         - break when both arrays contain empty values


#  START
#   # Given two arrays 
#  SET new_arr = []
#  SET count = 0
#  WHILE arr1 != nil && arr2 != nil
#     new_arr << arr1[count]
#     new_arr << arr2[count]
#     count += 1
# END
# READ new_arr

# END


def interleave(arr1, arr2)
  new_arr = []
  count = 0
  loop do
    break if arr1[count] == nil 
    new_arr << arr1[count]
    new_arr << arr2[count]
    count += 1
  end
  new_arr
end

p interleave([1, 2, 3], ['a', 'b', 'c'])# == [1, 'a', 2, 'b', 3, 'c']

#_launch_solution

def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end