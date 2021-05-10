# Input: array (integers)
# Output: integer (sum of each leading subsequence of array)

# Rules:
#    -Explicit:
#        - takes array of numbers(integers)
#        - sums sum of each leading subsequence of number array
#        - returns sum(integer)

# Data Structures/Algorithm
#  -take arr of integers
#  -initialize sum variable
############################ loop algorithm
#     -set count variable to 1
#     -begin loop
#           - invoke shortcut syntax on arr (from first index to count)
#                        - set sum equal to sum of elements 
#           - increment count
#     -end loop if count equals length of input array      

def sum_of_sums(arr)
  count = 1
  sum = 0
  loop do
    break if count >= arr.size + 1
    sum += arr[0, count].sum
    count += 1  
  end
  sum
end



#_refactor_with_each 

def sum_of_sums(arr)
  sum = 0
  arr.each_with_index do |_,idx|
    sum += arr[0, idx + 1].sum
  end
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35


#_launch_solutions__

def sum_of_sums(numbers)
  sum_total = 0
  accumulator = 0

  numbers.each do |num|
    accumulator += num
    sum_total += accumulator
  end

  sum_total
end

def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end