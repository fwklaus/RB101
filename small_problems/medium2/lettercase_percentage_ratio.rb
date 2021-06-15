# input: string
# output: hash

# rules:
#   -explicit:
#       -takes a string
#       -returns a hash:
#           1. percentage of lowercase letters in the string
#           2. percentage of uppercase letters
#           3. percentage of characters that are neither
#       -assume the string will always contain at least one character      

## DataStructures/Algorithm:
# -count
# -hash
# -values
# -each

# -initialize hash
# -take string
# -initialize 3 key-value pairs
#     -lowercase => integer
#     -uppercase => integer
#     -neither => integer
# -divide each value by length of string
# 



def letter_percentages(string)
  hsh = {}
  
  hsh[:lowercase] = string.count('a-z')
  hsh[:uppercase] = string.count('A-Z')
  hsh[:neither] = string.count('^A-Za-z')
  
  hsh.each do |key, value|
    hsh[key] = (value.to_f / string.length.to_f) * 100
  end
  p hsh
end




p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }


# launch_solution_

def letter_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end
