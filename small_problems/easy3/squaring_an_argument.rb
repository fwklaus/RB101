# Squaring an Argument

# Using the multiply method from the "Multiplying Two Numbers" problem,
# write a method that computes the square of its argument (the square is the
# result of multiplying a number by itself).

def multiply(x,y)
  x * y
end


def square(x)
  multiply(x, x)
end

puts square(5) == 25
puts square(-8) == 64


# Further Exploration___________________________________________________________
# to the power of n

# repeateldly invoke multiply passing in two args(n,n)
# initially accumulator should be set to 0
# assign result of multiply to memo variable


def nth_power(n, power)
  memo = n
  
  memo = (multiply([n], power)).reduce(&:*)
  
  memo

end


p nth_power(2,2)





# without using the multiply method
=begin
def nth_power(n, power)
  power_array = []
  
  1.upto(power) { |_| power_array << n}
   
  power_array.reduce(&:*) 
  
  
end

=end