# Input: nested array
# Output: array

# Rules:
#  -Explicit:
#     - takes an array of 2-element arrays:
#            -fruit and quantity
#     - converts array to a one dimensional array
#            -duplpicates fruit quantity times 

# DataStructures/Algorithm:
#  - initialize new array ([])
#  - takes a multidimensional array
#       -fruit and quantity(2-element arrays)
#  -iterate over array (each)
#       -at each sub-array, add element at 0 to new array
#        element 1 number of times
#  - for each sub_array
#       -multiply string by quantity value
#  - return array as one-dimensional array (join, split)


def buy_fruit(list)
  new_arr = []
  list.each{ |el|new_arr << (el[0] + ' ') * el[1]}
  new_arr.join.split(' ')
end



p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]


# _launch_solutions___

def buy_fruit(list)
  expanded_list = []

  list.each do |item|
    fruit, quantity = item[0], item[1]
    quantity.times { expanded_list << fruit }
  end

  expanded_list
end

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

list.each do |fruit, quantity|
  quantity.times { expanded_list << fruit }
end