# Input: string
# Output: string(next to last string from argument)

# Rules:
#   -Explicit:
#       - Takes a string
#       - returns second to last word from string argument
#       - assume the input string always contains at least 2 words
#       - words are any sequence of non-blank characters
#

# Data Structures/Algorithm
#   - method takes string of at least two words
#   - split string to array 
#   - invoke slice shortcut syntax on split string
#        - reference second to last word from string array
#   -implicitly return second to last word from string array

def penultimate(str)
  str.split[-2]
end


p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

