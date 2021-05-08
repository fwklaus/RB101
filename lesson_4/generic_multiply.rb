# update our double_numbers method to not only be able to double the values in
# an array, but to multiply by any number. 

# Input:  array, integer
# Output: array with each element multiplied by given integer 


def multiply(arr, int)
  counter = 0
  new_arr = []
  
  loop do
    break if counter == arr.size

    new_arr <<  arr[counter] * int

    counter += 1
  end
  new_arr
end


my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]

#_launch_solution______

def multiply(numbers, multiplier)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    multiplied_numbers << numbers[counter] * multiplier
    counter += 1
  end

  multiplied_numbers
end