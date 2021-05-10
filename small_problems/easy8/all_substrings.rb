# Input: string
# Output: array(all substrings of string )

# Rules:
#   -Explicit:
#       -takes string
#       -returns array of all substrings from string input 
#       -return list ordered by where in the list substring begins
#                -substrings that start at position 0 should come first
#                -then position 1, and so on
#                -substrings should be returned in order from shortest to longest
#       -multiple substrings will occur at each position
#       -use the leading_substrings method from the previous exercise

#  -Implicit:
#      -Test case is not example of formatting for our output, just formatted for 
#       readability

# Data Structures/Algorithm
#   -initiialize all_substrings array
#   -initialize empty index variable
################################################
#   -invoke slice shortcut syntax on input string(index, str.length)
#             -save return value to variable
#             -pass variable to leading substrings array
#                      - concatenate return value to all substrings array
#             -increment index by one
#   - break if index == str.length
################################################
#   - return flattened all_substrings array

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


def substrings(str)
  all_substrings = []
  index = 0
  loop do
    break if index == str.length
    current_substring = str[index, str.length]
    all_substrings << leading_substrings(current_substring)
    index += 1
  end
  all_substrings.flatten
end


p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

#_launch_solution_____

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end