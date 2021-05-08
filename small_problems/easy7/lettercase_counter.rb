# Input: string
# Outpus: hash containing three key-value pairs (number of characters in the 
#    string that are lowercase letters, number of characters that are upperacase
#    letters, number of characters that are neither)

#  Rules:
#     # Explicit:
#         - takes a string
#         - returns hash with three key value pairs
#                - contains:
#                     -count of lowercase letters in string
#                     -count of uppercase letters in string
#                     -count of characters that are neither
#                 - keys are symbols

#  Algorithm/Data Structure:
#      - string
#      - count
#      - hash


#      - take string
#      - assign lowercase letter count from string to :"lowercase" key
#      - assign uppercase letter count to :"uppercase" key
#      - assign count of letters that are neither to :"neither" key
#      - return hash

def letter_case_count(str)
  count_hash = {}
  count_hash[:"lowercase"] = str.count('a-z')
  count_hash[:"uppercase"] = str.count('A-Z')
  count_hash[:"neither"] = str.count('^a-zA-Z')
  count_hash
end




p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

=begin
#_launch_solutions___

UPPERCASE_CHARS = ('A'..'Z').to_a
LOWERCASE_CHARS = ('a'..'z').to_a

def letter_case_count(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |char|
    if UPPERCASE_CHARS.include?(char)
      counts[:uppercase] += 1
    elsif LOWERCASE_CHARS.include?(char)
      counts[:lowercase] += 1
    else
      counts[:neither] += 1
    end
  end

  counts
end



def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end
=end