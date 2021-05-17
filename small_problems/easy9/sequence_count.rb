# Input: two integers(count, first number of a sequence)
# Output: array

# Rules:
#  -Explicit:
#     -takes two arguments
#         -count(number of elements)
#         -number(to begin sequence, and multiplication value)
#     -returns array containing sequence
#     -count will always be 0 or greater
#     -starting number can have any integer value
#     -return empty array if count is 0

# DataStructures/Algorithm:
# - arr
# -while
# -clone

# - initialize new array
# - set increment equal to cloned num value
# - takes two arguments
#   - until count is 0 
#     - append num to arr
#     - step by number incremented by num
#     - decrement count
# - return arr  

def sequence(count, num)
  arr = []
  increment = num.clone
  while count > 0
    arr << increment
    increment += num
    count -= 1
  end
  arr
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

#_launch_solution___

def sequence(count, first)
  sequence = []
  number = first

  count.times do
    sequence << number
    number += first
  end

  sequence
end

def sequence(count, first)
  (1..count).map { |value| value * first }
end