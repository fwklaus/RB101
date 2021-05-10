# Input: string
# Output: array(all substrings of input string)

# Rules:
#   -Explicit:
#       -takes a string
#       -returns array of all substrings of string
#                       -substrings start at the beginning of original string
#       -return value ordered from shortest to longest substring

# Data Structures/Algorithm:
# -take a string
# -initialize empty substring array
# -initialize empty index variable
######################## 
# -begin loop
#   -end loop if index equals string.size
#   -slice first character from string
#         - invoke slice shortcut syntax on oringinal string
#                 - slice from 0 to index + 1
#         - append sliced string to substring array
#   -increment index by 1 
# -end loop
#########################
# -return array of substrings

def leading_substrings(str)
  substring = []
  index = 0
  loop do 
    break if index == str.size
    substring << str[0, index + 1]
    index += 1
  end  
  substring
end


p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']



#_launch_solution_______

def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end