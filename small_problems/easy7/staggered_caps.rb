# Part 1
# Input: string
# Output: new string (oringinal value with staggered capitalization)
=begin
# Rules:
#   -Explicit:
#       - takes string
#       - returns new string
#            -original value with staggered caps
#                  -every other character is capitalized, the rest are lowercase
#                   - non-alphanumeric characters remiain unchanged, but still 
#                     count in the staggered count
#                     

#   -Implicit:
#       - first index is capitalized, alternating count starts from there
#       - count includes spaces and non-alphabetic chraracters

# Data Structures/Algorithm:
#   -each_with_index
#   -chars
#   -to_a

#   
#   -start
#   - split string to array
#   -iterate over given string. 
#      -capitalize odd indexed numbers
#             - if characters are non-alphanumeric do not capitalize them
#      return new string

def staggered_case(str)
  new_str = str.chars.each_with_index do |char, idx|
    idx.even? ? char.capitalize! : char.downcase!
  end
  new_str.join
end



p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

#_launch_solution____

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end
=end
#_______________________________________________________________________________
# Part 2

# modify previous exercise so it ignores non-alphabetic characters when determin-
# ing whether it should uppercase or lowercase each letter


# Data Structures/Algorithm
#  -next
#  -toggle
#  -string
#  -chars

# -initialize empty string
# -set uppercase equal to true
# -split string into individual characters - chars
# -iterate over string -map
#   -if the character is not an alphabetic character
#      - append character to string
#   -elsif character is alphabetic and uppercase is set to true
#      -set current character to uppercase
#      -append to string
#   -else
#      -set current character to lowercase
#      -append to string
# - toggle the uppercase value
# -return the new populated string
# 

# How do we test for an alphabetic character?
#  -match?
#  - =~


def staggered_case(str)
  new_str = ' '
  uppercase = true
  
  str.chars.map do |char|
    if char.match?(/[^'A-Za-z]/)
      new_str << char
      next
    elsif uppercase 
      new_str << char.upcase
    else
      new_str << char.downcase
    end
    uppercase = !uppercase
  end
  new_str.strip
end


p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'




