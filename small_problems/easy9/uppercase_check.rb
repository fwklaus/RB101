# Input: string
# Output: boolean

# Rules: 
#   -Explicit:
#      -takes a string
#      -performs boolean check on alphabetic chracters inside string
#         -checks if they are all uppercase
#         -ignore non-alphabetic characters
#      -returns true if all alphabetic characters are uppercase
#         -false otherwise


# Data Structures/Algorithm
#   -takes string
#   -initialize boolean variable
#   -set new string equal to original string with all non-alphabetic characterss deleted (delete)
#   -split string to array
#   -call all? on split string array
#       -check if characters are uppercase
#     -return boolean value


def uppercase?(str)
  str.delete('^a-zA-Z').split(//).all? do |char|
    char == char.upcase
  end
end


p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

#_launch_solution___

def uppercase?(string)
  string == string.upcase
end
