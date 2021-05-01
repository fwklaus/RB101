# Input: two arrays
# Output: array (containing elements from input arrays)

# Rules:
#     Explicit:
#       - no duplicate values in returned array, even if present in original
#     Implicit
#       - doesn't seem to be destructive

# Algorithm:
#   - takes two arrays
#   - iniialize new array
#   - call Array#concat on new array, passing in arrays
#   - call Array#uniq on new array
#   - return new array


def merge(arr1, arr2)
 new_arr = []
 new_arr.concat(arr1,arr2).uniq
end


p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


#_launch_solution_____

def merge(array_1, array_2)
  array_1 | array_2
end
