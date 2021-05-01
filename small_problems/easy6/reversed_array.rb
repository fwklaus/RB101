# Part 1)
=begin
# input: array
# output: array(same array object)

# Rules:
#    Explicit: 
#       - takes array
#       - reverses array elements in place(mutate the caller)
#       - return same array object
#       - Do not use Array#reverse or Array#reverse!

#    Implicit: 
#       - works on integer and string types
#       - not reversing the elements themselves, only the elements of the array


#    Algorithm:
#        - method takes an array
#        - set start_count = to 0
#        - set reverse_count = to -1
#        - loop
#           - set a = to array reference at start count
#           - set b = to array reference at reverse count
#           - perform parallel assignment, switching a and b
#           - increment start_count by one, and decrement reverse count by 1
#           - break if start_count >= arr length / 2
#       - end loop
#       - return arr


def reverse!(arr)
  start_count = 0
  reverse_count = -1
  while start_count < arr.size / 2
    arr[start_count], arr[reverse_count] = arr[reverse_count], arr[start_count] 
    start_count += 1
    reverse_count -= 1
  end
  arr
end


list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
p reverse!(list) == [] # true
list == [] # true


#_launch_solution
def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

=end
#_______________________________________________________________________________
# Part 2)

# Input: array
# Output: array(new) (elements of original array in reverse)

# Rules: 
#        Explicit: 
#            -reverse elements of original array
#            - do not modify the original list
#            - do not use Array#revese, or Array#reverse!
#            - do not use previous exercise method

#        Implicit: 
#            - takes stings and integers

# Algorithm:
#   - method takes array
#   - initialize new array
#   - initialize count - set to last element of array
#   - loop over array
#     - call array[count] and append element at index to new arr
#     - decrement count
#     - break if arr[count] == nil
#   - end loop
#   - return new array


def reverse(arr)
  new_arr = []
  count = -1
  loop do
    break if arr[count] == nil
    new_arr << arr[count]
    count -= 1
  end
  new_arr
end





p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true


#_launch_solution


def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end