# Input: array
# Output: new array (odd indexed numbers doubled)

# Rules:
#    -Explicit:
#       - takes array
#       - only doubles array values with odd index numbers
#       -returns new array

# [1,2,3,4,5] => [2, 2, 6, 4, 10]

# Data Structure/Algorithm
#     -loop
#     - if statement

#  - initialize empty array
#  - initialize count variable
#  - loop 
#       - if count is odd, add element referenced by arr at count to new_arr
#       - increment count by 1
#       - break if count is greater than array.size
#  - end loop
#  - return new_array

def double_odd_indexes(arr)
  new_arr = []
  count = 0
  
  loop do
    break if count == arr.size
    new_arr << arr[count]
    
    if count.odd? 
      new_arr[count] *= 2
    end
    
    count += 1
    end
    new_arr
end



my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indexes(my_numbers)  # => [1, 8, 3, 14, 2, 12]

# not mutated
p my_numbers                      # => [1, 4, 3, 7, 2, 6]

#_launch_solution____

def double_odd_indices(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_indices(my_numbers) # => [1, 8, 3, 14, 2, 12]