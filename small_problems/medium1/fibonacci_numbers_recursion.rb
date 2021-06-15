# Input: integer(nth)
# Output: integer(return value of the recursive call)

# Rules: 
#   -explicit:
#       - sequence of numbers starting with 1 and 1
#       - each number is the sum of the previous two in the sequence


=begin
F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2
=end


def fibonacci(n)
  if n < 2
    n
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end




p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765


# launch solution________________-

def fibonacci(nth)
  return 1 if nth <= 2
  fibonacci(nth - 1) + fibonacci(nth - 2)
end