=begin
PROBLEM: write a method that calculates and returns the first fib number
 that has the specified digits

input: integer
output: integer
mutating?: no

rules:
   -explicit:
    - takes an integer
    - calculates the numbers in the fibonacci sequence
    - returns the first number with the number of digits from the input
    -   fibonacci sequence
          - the first 2 numbers are 1
          - each subsequent number is the sum of the previous two numbers
   -implicit:
     
unclear parts of problem?:

examples/test_cases:
(2) == 7          # 1 1 2 3 5 8 13
(3) == 12         # 1 1 2 3 5 8 13 21 34 

data/alg:
-takes an integer
- initialize first and second fibonacci number
- initialize return variable 
- create a loop
- calculate the next number in the sequence
        - check if the number is equal to given size



=end

def find_fibonacci_index_by_length(size)
  first, second = 1, 1
  fib = 0
  seq_count = 3

  loop do
    first, second = second , first + second
    fib = second
    break if fib.to_s.size == size
    seq_count += 1
  end

  seq_count
end


p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12           # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847