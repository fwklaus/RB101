# input: integer
# output: string(alternating 1s and 0s)

# Rules:
#   -Explicit:
#       - takes a positive integer
#       - returns string of alternating 1s and 0s
#       - always starts with 1
#       - length of the string should match the given integer

## DataStructures/Algorithms:
# -take integer(n)
# -initialixe string
# -n times, print a character(times)
#    -if current iteration is even append '1' to string
#    -else append '0' to string

=begin

# times
def stringy(n)
  string = ''
  n.times do |char|
    char.even? ? string << '1' : string << '0'
  end
  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'


#upto
def stringy(n)
  string = ''
  1.upto(n) do |char|
    char.odd? ? string << '1' : string << '0'
  end
  string
end

puts stringy(6)# == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'
=end

# Further Exploration___________________________________________________________

# stringy takes additional argument - defaults to 1
#    -if method is called with argument set to 0
#              -string of alternating 0s and 1s
#


def stringy(n, start_value = 1)
  arr = []
  if start_value == 1
    start_value.upto(n){ |char| char.odd? ? arr << 1 : arr << 0 }
  else
    start_value.upto(n-1){ |char| char.odd? ? arr << 1 : arr << 0 }
  end
  arr.join
end



puts stringy(6) == '101010'
puts stringy(6,0) == '010101'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
