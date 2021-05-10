# Part 1)
# Input: string
# Output: new string(every character is doubled)

# Rules:
#   -Explicit: 
#       -takes string
#       -returns new string
#             -every character in new string is doubled
#       -doubles non-alphabetic characters as well(eg ' ', !)

#   -Implicit:
#       - doesn't double empty strings

# Data Structures/Algorithm
#  -takes string
#  -initialize empty new string array variable -[] 
#  -check if given string is empty - empty?
#        -return string if empty
#  -otherwise, split string - chars
#       -iterate over string arr - each
#             -double every character 
#             -append doubled character to new string arr
#  -return new_string array joined to string - join
=begin
 
def repeater(str)
  new_str = []
  if str.empty?
    return str
  else
    str.chars{|char| new_str << char * 2}
  end
  new_str.join
end




p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

#_launch_solution___

def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end
=end
#_______________________________________________________________________________
# Part 2)

# Input: string
# Output: new string

# Rules:
#   -Explicit:
#      -takes a string
#      -returns new string
#          -every consonant character is doubled 
#                       -(a,e,i,o,u), digits, whitespace, punctuation ignored

#   -Implicit:
#       -empty strings are returned


# Data Structures/Algorithm
#  -take string
#  -initialize new_string variable
#  -iterate over every char string - each_char
#         -if character is a consonant, append twice
#         -else, append character once
#  -return new_string

# how do we select consonants? match?


def double_consonants(str)
  new_str = ''
  str.each_char do |char|
    if char.match?('[^aeiou/\W//\d/]')
      new_str << char << char
    else
      new_str << char
    end
  end
  new_str
end


p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""


#_launch_solution___

CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end

