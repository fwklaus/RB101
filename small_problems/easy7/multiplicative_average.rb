# Input: array(integers)
# Output: Prints float rounded to three decimal places

# Rules
#   Explicit: 
#      - Takes array of integers
#      - Multiplies all the numbers of the array together
#      - divides the result by the number of entries in the array
#      - prints the result rounded to 3 decimal places
#      - assume array is non-empty

#   Implicit:
#      -Prints float as output

# Data Structures/Algorithm:
#      - Take array - array
#      - save result of calling size on array to a length variable
#      - call reduce on array - .reduce(:*)
#               - convert result to float
#      - save the result of dividing reduced array by array.size variable
#      - print the result of rounding the result to three decimal places - format 


def show_multiplicative_average(arr)
  length = arr.size.to_f
  result = (arr.reduce(:*)) / length
  puts "The result is #{format("%.3f", result)}"
end

show_multiplicative_average([3, 5])                 #=> The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

#_launch_solution

def show_multiplicative_average(numbers)
  product = 1.to_f
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts "The result is #{format('%.3f', average)}"
end
