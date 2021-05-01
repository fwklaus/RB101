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


def include?(arr, value)
  arr.each{|element| return true if element == value}
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# other_launch_solution

def include?(array, value)
  !!array.find_index(value)
end
