# Input: array
# Output: two arrays (as pair of nested arrays)

# Rules:
#    Explicit:
#       - first array contains first half of original array
#       - second array contains second half of original array
#       - if original array contains odd number of elements,
#         middle element should be placed in first half array

#    Implicit:
#       - Will return two arrays, no matter what
#       - even number length arrays split amongst the two,
#       - odd number length arrays favor the first half array

# Example:
#   arr = [1,2,3,4,5] => [[1,2,3], [4,5]]
#   arr = [1,2,3,4] => [[1,2], [3,4]]
#   arr = [1,2,3]  = > [[1,2], [3]]
#   arr = [1] => [[1], []]
#   arr = [] => [[],[]]

# Data Structures/ Algorithm
#  - Inintialize empty overall array
#  - Initialize first_half array
#  - Iniitialize second_half array
#  - loop over array 
#      -if array length is even, slice first half from array and append to first
#       half array, slice second half to second_half array
#      - if array length is odd, append middle element to first_half array
#  - assign first_half array to first position of empty overall array, and second_half
#    array to second position of empty overall array

def halvsies(arr)
  nested_arr, first_half, second_half = [], [], []
  index = 0
  while index < arr.size
    if arr.length.even?
      index < (arr.size / 2) ? first_half << arr[index] : second_half << arr[index] 
    elsif arr.length.odd?
      index <= (arr.size / 2) ? first_half << arr[index] : second_half << arr[index]
    end
    index += 1
  end
  
  nested_arr = [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

#_launch_solution_____

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end