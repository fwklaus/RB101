# Part 1)
# Input: array
# Output: array
=begin
# Requirements:
#    -Explicit: 
#         -takes an array
#         -write method that rotates an array
#               -moves first element to the end of the array
#               -does not modify original array
#         -do not use Array#rotate or Array#rotate!

#    -Implicit:
#         -takes an array - string or integer
#         -returns new array
#    

# DataStructures/Algorithm
#    -copy array  (clone)
#    -remove last element first element from copied array (shift)
#    -save shifted element to variable
#    -push shifted variable to end of copied array
#    -return copied array


def rotate_array(arr)
  arr2 = arr.clone
  shifted = arr2.shift
  arr2.push(shifted)
end


p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true


#_launch_solution___

def rotate_array(array)
  array[1..-1] + [array[0]]
end
#_______________________________________________________________________________
# Part 2)

# Input: 2 integers(number to rotate, n digits)
# Output: integer

# Rules:
#   -Explicit:
#       -method rotates last n digits of a number
#       -may use rotate method from part 1
#       -assume n is always positive number
#       -note:rotating one digit results in original number being returned

# DataStructures/Algorithm:
#   -take two arguments:
#         -number to perform rotation on
#         -number of digits to rotate
#   -convert number to string (to_s)
#   -call slice on string number from -n digits to end of string (number(-n..))
#       -pass number to rotate method
#   -concatenate returned value to string number
#          -convert string to integer
#   -return integer


def rotate_array(arr)
  arr[1..-1] << arr[0]
end

def rotate_rightmost_digits(number,n)
  number_arr = number.to_s.chars
  n_arr = number_arr.slice!(-n..)
  (number_arr << rotate_array(n_arr)).join.to_i
end



p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917


#_launch_solution___

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end
=end

#_______________________________________________________________________________
# Part 3)

# Input: integer
# Output: integer(maximum rotation of input)

# Rules:
#   -Explicit:
#       -write a method that takes an integer
#       -use methods from previous exercises
#       -return input after maximum rotation applied
#       -do not have to handle multiple zeroes

#   -Implicit:
#       -remove leading zeroes

# DataStructures/Algorithm:
#   -take an integer
#   -call rotate array on number
#        -assign return value of rotate_array to rotation variable 
#   -repeatedly call rotate_rightmost_digits (loop)
#          -pass in rotation variable to rotate_rightmost_digits
#          -pass in n digits to rotate to rotate_rightmost_digits
#               -reassign rotation variable to rotate_rightmnost_digits return value on each
#                iteration
#                -rotate one less digit on iteration
#          -break out of loop when all but the last two digits are fixed

### Maximum Rotation: 
#  735291 => 352917
#     -now, keep first digit fixed:
#        352917 => 329175
#           -now,keep first 2 fixed:
#               329175 => 321759
#                -now, 3 fixed:
#                   -321759 => 321597
#                     -now, 4:
#                        -321597 => 321579
#  



def rotate_array(arr)
    arr[1..-1] << arr[0]
end

def rotate_rightmost_digits(number,n)
  number_arr = number.to_s.chars
  n_arr = number_arr.slice!(-n..)
  (number_arr << rotate_array(n_arr)).join.to_i
end

def max_rotation(num)
  rotation_number = num.to_s.size
  max_rotation = num
  
  rotation_number.downto(2) do |n|
    max_rotation = rotate_rightmost_digits(max_rotation,n)
  end
  
  max_rotation
end




p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
