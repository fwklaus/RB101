# rewrite recursive fibonacci method so that it computes its result without recursion

=begin
def fibonacci(n)
  if n <= 2
    n
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end
=end

def fibonacci(nth)
  first,last = 1, 1
  
  3.upto(nth) do |_|
    first,last = last, first + last
  end

  last  
end

p fibonacci(3)

#p fibonacci(20) == 6765
#p fibonacci(100) == 354224848179261915075
#p fibonacci(100_001)#  => 4202692702.....8285979669707537501