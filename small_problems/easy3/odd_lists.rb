# Write a method that returns an Array that contains every other element of
# an Array that is passed in as an argument. The values in the returned list
# should be those values that are in the 1st, 3rd, 5th, and so on elements of
# the argument Array.
=begin
def oddities(arr)
  odd_list = []
  arr.each_with_index do |ele, idx|
    if idx.even?
    odd_list << ele
    end
  end
  odd_list
end

puts oddities([2,3,4,5,6]) == [2,4,6]
puts oddities([1,2,3,4,5,6]) == [1,3,5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []


puts oddities([2,3,4,5,6]) == [2,4,6]
puts oddities([1,2,3,4,5,6]) == [1,3,5]
puts oddities(['abc','def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []


#__________________launch_solution______________________

def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end
#__________________further_esploration__________________

# 1)

def oddities(array)
  index = 0
  new_array = []
  while index < array.size
  new_array << array[index]
  index += 2
  end
  new_array
end


p oddities([2,3,4,5,6])
p oddities([1,2,3,4,5,6])
p oddities(['abc','def'])

=end

#2)

def oddities(array)
  new_array = []
  array.to_enum.with_index{|ele, idx| new_array << ele if idx.even?}
  return new_array
end

p oddities([2,3,4,5,6])
p oddities([1,2,3,4,5,6])
p oddities(['abc','def'])
p oddities([])


