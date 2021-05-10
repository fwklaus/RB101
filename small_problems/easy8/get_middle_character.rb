# Input: string (non-empty)
# Output: string (middle cahracter(s) of argument)

# Rules
#   -Explicit:
#       -takes non-empty string
#       -returns middle character(s) of the argument
#                 -if argument length is odd, return exactly one character
#                 -if even length, return exactly two characters

#   -Implicit:
#       -return character can be non-alphabetic


# Data Structures/Algorithm
# -take non empty string - set default
# -set length variable to string length
# -assign result variable to if statement 
# -set index variable equal to length divided by 2
#      -if string length is odd 
#                 -slice character from argument at index
#      -if string length is even
#                 -slice character at index to the next element
# -return result
# 

def center_of(str = 'x')
 length = str.length
 index = length / 2
 result = if str.length.odd?
            str[index]
          elsif length.even?
            str[(index - 1)..index]   
          else
            str
          end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
