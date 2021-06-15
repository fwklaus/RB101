require 'pry-byebug'
# input: array
# output: mutates original array

# rules:
#   -explicit:
#       -take an array as argument
#       -sorts array using bubble sort algorithm
#       -sort in place(destructively)
#       -assume array contains at leasy 2 elements

### DataStructures/Algorithm:
# - take array 
# - compare first two elements
#      -if first element is greater than second element, switch elements
# - compare second and third elements
#      - if first element is greater than second...

# START
# FOR array, compare each element with the next element in the array
# IF first is greater that second, swap elements 
# ELSIF second is greater, move to next comparison 
# END


## swap
# START
# BEGIN loop
# IF current element is greater than the next
#         swap elements 
#               
#



def bubble_sort!(arr)
 swaps = true
 while swaps == true
  swaps = false 
  arr.each_with_index do |el, idx|
    break if arr[idx + 1] == nil
    if el > arr[idx + 1]
     arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
     swaps = true
    end
  end
  end
end


# go through it a second time
# set up a loop 
# if there are no more swaps, break out of loop



=begin
array = [5, 3]
bubble_sort!(array)
p array == [3, 5]


array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]
=end

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
