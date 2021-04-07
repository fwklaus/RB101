# Write a method that takes one argument, a positive integer, and returns a
# string of alternating 1s and 0s, always starting with 1. The length of the
# string should match the given integer.

def stringy(int, ord = 1)
  str = ''
  int.times do |x|
    if ord == 0
      str << '1' if x.odd?
      str << '0' if x.even?
    else
      str << '0' if x.odd?
      str << '1' if x.even?
    end
  end 
  str
end

puts stringy(6, 0) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# The tests above should print true

#_____________________launch_solution______________

=begin
def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

=end

