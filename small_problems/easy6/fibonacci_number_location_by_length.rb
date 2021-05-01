# inputs: integer
# output: integer(index number of first fib number == to argument)

# rules:  
#         Explicit Requirements: 
#                  - each number is the sum of previous two numbers
#                  - first fibonacci number has index 1
#                  - method returns index, not the value of the index
#                  - the argument is always greater than 2
#         
#         Implicit Requirements:
#                  - Method returns the index of the first number with the 
#                    specified length(input)
# 


# Algorithm:
#   - Method takes an argument(an integer)
#   - set count = 1
#   - loop through fibonacci sequence  
#       -check if fib_number length in digits(.to_s.size)) is equal to integer
#   - 

# Fibonacci Sequence:
#   - first number = 1
#   - second number = 1
#   - loop
#     - next number in sequence = first number + second number
#     - first number = second number
#     - second number = next number
#      - count += 1
#   - break out of loop when next number.to_s.length = int


def find_fibonacci_index_by_length(int)
  count = 2
  first_num = 1
  second_num = 1
  next_fib_number = 0
  loop do
    break if next_fib_number.to_s.size == int
    next_fib_number = first_num + second_num
    first_num = second_num
    second_num = next_fib_number
    count += 1
  end
  count
end


p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

#_launch_solution_________

def find_fibonacci_index_by_length(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end