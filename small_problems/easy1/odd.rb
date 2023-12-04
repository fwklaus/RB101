=begin
PROBLEM:

input: integer 
output: boolean
mutating?:

rules:
   -explicit:
     - takes an integer
          - may be positive, negatice, or zero
     - retuns boolean
            - true if number's absolute value is odd

     - may not use #odd? or #even?
     - assume valid integer value
    
   -implicit:
     
unclear parts of problem?:

examples/test_cases:


data/alg:

- take integer as input
- divide number by % 2
     - if result is not 0, we have an odd number

=end


def is_odd?(int)
  result = int % 2
  result != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true