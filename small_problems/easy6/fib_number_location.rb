def find_fibonacci_index_by_length(int)
  first, second = [1, 1]
  count = 2

  loop do
    next_fib = first + second
    first, second = second, next_fib

    count += 1
    return count if next_fib.to_s.size == int
  end
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847