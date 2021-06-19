# Input: array
# Output: integer

# Rules: 
#    -Explicit: 
#        - takes unordered array
#        - exactly one value occurs twice
#        - every other values occurs once
#        - return the duplicate value

# Data Structure/ Algorithm:
#  loop
#  array

# - initialize duplicate array of original
# - initialize empty index variable
# - loop over duplicate
#     - delete current element at index from duplicate array
#     - check if duplicate array still includes deleted element elsewhere
#         -return value if duplicate includes element
#     -else
#         -continue to the next iteration
#     -break if duplicate array is empty
# - end
=begin
def find_dup(arr)
  new_arr = arr.clone
  index = 0
  current_var = 0
  loop do
    break if new_arr.empty?
    current_var = new_arr.delete_at(index)
    if new_arr.include?(current_var)
      break
    end
  end
  current_var
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
          

=end


# input: array
# output: integer

# rules:
#  -explicit:
#     -given an inordered array
#     -exactly one value occurs more than once (twice)
#     -method finds, and returns duplicate value

# D/A:
# count
# from 1 to arr.size - 1
# count each element
# if count is greater than 1, return element



def find_dup(arr)
  0.upto(arr.size - 1) do |idx|
   return arr[idx] if arr.count(arr[idx]) == 2 
  end
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73


# Further_exploration


