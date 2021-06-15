# Create a method that takes two arguments, multiplies them together, and
# returns the result.
=begin
def multiply(x,y)
  x * y
end

puts multiply(5,3) == 15
=end
# Further_Exploration___________________________________________________________

a = [1,2]

def multiply(x,y)
  x * y
end

p multiply(a,3)

# it's multiplying the outer array by 3, rather than than the array elements
# The pair of array elements repeat 3 times. 


# 5 * 2 == 10
# "hi" * 2 = "hihi"
#[1,2] * 2 = [1,2,1,2]
