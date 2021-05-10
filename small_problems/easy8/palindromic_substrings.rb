# Input: string
# Output: array(substrings of input that are palindromic)

# Rules:
#   -Explicit:
#       -takes a string
#       -returns array
#            -substrings of string input that are palindromic(same forwards and back)
#            -substrings arranged in same sequence as they appear in the string
#            -duplicate palindromes included multiple times
#       -use substrings, and leading substrings methods from previous exercises
#       -case sensitive
#       -assume single characters are not palindromes

#   -Implicit:
#       -includes non-alphabetic characters


# Data Structures/Algorithm
#  - invoke substrings passing in str 
#  - perform selection on return value - select
#        -select value if value is same forwards and back - reverse
#               - and value is no less than two characters long 
#  -return palindrom array



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

def palindromes(str)
  substrings(str).select{|sub| sub.reverse == sub && sub.length >= 2 }
end


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
