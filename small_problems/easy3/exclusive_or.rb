# Input: booleans(2)
# Output: boolean

# rules
#   -exp:
#       -returns true if exactly one argument is true
#       -returns false otherwise


def xor?(a, b)
  a != b ? true: false

end


xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false


# Further Exploration___________________________________________________________

=begin
xor can't be short circuit. It has to evaluate every operand to be sure that
only one expression is truthy. 

=end


#____________________launch_solution__________________________

def xor?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end

#_______________________________or_______________________________

def xor?(value1, value2)
  !!((value1 && !value2) || (value2 && !value1))
end


