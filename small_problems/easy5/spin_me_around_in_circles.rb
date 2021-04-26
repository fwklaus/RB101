# Given the method's implementation, will the returned string be the same
# object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

p spin_me(hello) # "olleh dlrow"

# It is a different object