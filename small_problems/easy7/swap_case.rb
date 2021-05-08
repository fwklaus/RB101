# Input: string
# Output: new string(uppercase and lowercase letters swapped)

# Rules:
#   -Explicit:
#       - takes a string
#       - returns new string
#             - uppercase letters replaced lowercase, and vice versa
#             - all non-alphanumeric characters unchanged
#       - Do not use swapcase
#  

# Data Structure/Algorithm:
#  - constant 
#  - array
#  - split 
#  - range
#  - upcase
#  - letter
#  - join

# - initalize an uppercase letter range
# - initialize a lowercase letter range
# - take string
# - save split string to new array
#      -delimit split by each character
# - transform split string
#        - if character is contained within lowercase range, upcase letter
#        - if character is contained within uppercase range, downcase letter
# - returned joined array

UPPERCASE = ('A'..'Z')
LOWERCASE = ('a'..'z')

def swapcase(str)
 split_arr = str.split(//)
 swapped = split_arr.map do |char|
    if UPPERCASE.include?(char)
      char.downcase
    elsif LOWERCASE.include?(char)
      char.upcase
    else
      char
    end
  end
  swapped.join
end



p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

#_launch_solution___

def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end