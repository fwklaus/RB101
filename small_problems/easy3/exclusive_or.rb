# In this exercise, you will write a function named xor that takes two
# arguments, and returns true if exactly one of its arguments is truthy, false
# otherwise. Note that we are looking for a boolean result instead of a
# truthy/falsy value as returned by || and &&.


def xor?(a,b)
  if a!= b
    true
  else 
    false
  end
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true 
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

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


