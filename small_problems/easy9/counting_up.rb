# Input: integer
# Output: array(all integers)

# Rules:
#   -Explicit:
#      -takes integer argument
#      -returns array of all integers
#           -sequenced from 1 to the argument
#      -assume argument will always be a valid integer greater than 0

# Data Structures/Algorithm
# -takes integer 
# -initialize empty array
# -call upto on 1, passing in (argument - 1)
#      -on each iteration append current value to empty array
# return array


def sequence(int)
  num_array = []
  1.upto(int){ |int| num_array << int}
  num_array
end


p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

#_launch_solution___

def sequence(number)
  (1..number).to_a
end