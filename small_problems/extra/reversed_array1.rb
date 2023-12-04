require "pry-byebug"
=begin
PROBLEM:takes an array and reverses its elements in place

input: array
output: same array
mutating?: yes

rules:
   -explicit:
    - take an array as argument
        -reverses its elements in place
            -mutate the input array
    - return the same array object
        -reverses input array elements 
    - do not use built-in methods
   -implicit:
     
unclear parts of problem?:

examples/test_cases:


data/alg:
- take an array as an argument
- iterate from start of array to half of array
      - initialize variables for start index and end index - 0, -1
      - on each iteration, swap current element
        with corresponding element at end of array
         -when we get to half, break

=end

def reverse!(arr)
  half = if arr.size.even?
     ((arr.size)/2.0).ceil
  else
     (((arr.size)/2.0).ceil) - 1
  end

  first = 0
  last = -1
  (half).times do |_|
    arr[first], arr[last] = arr[last], arr[first]
    first += 1
    last -= 1
  end
  arr
end



# p list = [1,2,3,4]
# p result = reverse!(list)
# p result == [4, 3, 2, 1] # true
# p list == [4, 3, 2, 1] # true
# p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

# p list = ['abc']
# p reverse!(list) == ["abc"] # true
# p list == ["abc"] # true

# p list = []
# p reverse!(list) == [] # true
# p list == [] # true