# Write a method that determines and returns the ASCII string value of a string
# that is passed in as an argument.

def ascii_value(str)
  str_arr = str.split(//).each_with_object([]) do |char, memo|
    memo << char.ord
  end
  
  str_arr.sum
end



p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0


#_launch_solution_____

def ascii_value(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end