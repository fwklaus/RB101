# Input: array, search value
# Output: boolean(true if the search value is in the array)

# Rules:
#    Explicit: 
#       - takes array and search value as arguments
#       - returns true if seach value is in the array
#       - cannot use Array#include?

#    Implicit: 
#       - differentiates between valid nil values and empty index nil values


# How do we return true when the found value is n is nil?
=begin

def include?(arr, value)
  arr.each{|element| return true if element == value}
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
=end

# input: array, integer
# output: boolean

# rules:
#   -explicit
#      -takes array, and integer(search value)
#      -return true if integer is in array
#      -do not use array include?

# DataStruc/Alg
# iterate over array and perform comparison


def include?(arr, int)
  result = nil
  
  arr.each do |el|
    if el == int
      result = true
      break
    end
  end
  
  result
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false


# launch solution

def include?(array, value)
  !!array.find_index(value)
end