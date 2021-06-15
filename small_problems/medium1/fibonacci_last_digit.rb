# input: integer
# output: integer(last digit of the nth bibonacci number)

# rules:
#   -explicit: 
#       -return last digit of the nth fibonacci number
#   
#   -implicit:
#       -use procedural method from previous exercise
#       




def fibonacci(nth)
  first, last =  1,1
  
  3.upto(nth) do |_|
    first,last = last, first + last
  end
  last
end

=begin
def fibonacci_last(nth)
  fibonacci(nth).digits.first
end 
=end

def fibonacci_last(nth)
  last2 = [1,1]
  
  3.upto(nth) do |_|
    last2 = [last2.last, (last2.first + last2.last) % 10 ]  
  end
  
  last2.last
end




p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4

