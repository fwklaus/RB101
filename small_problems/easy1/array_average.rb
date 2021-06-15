# Input: array (containing integers)
# Output: integer (average of all numbers in the array)

# Rules:
#   -Explicit: 
#       -takes array containing integers
#       -returns average of numbers in the array - integer
#       -array will never be empty
#       -numbers will always be positive integers
=begin
def average(arr)
  arr.reduce(&:+) / arr.length
end


puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

=end
# Further Exploration___________________________________________________________
# output: float


def average(arr)
  (arr.reduce(&:+) / arr.length).to_f
end


puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
