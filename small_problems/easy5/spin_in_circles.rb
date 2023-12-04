def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"



# The return string is not the same obect as the one passed to the method
# Method `split` returns a new array, and that's the array we return