# Input: string 
# Output: new string(original string with first letter of each word capitalized, the
#         rest lowercase)

# Rules:
#   -Explicit:
#       - takes a string
#       - returns new string, modified copy of original string
#       - method capitalizes first letter of each substring, downcases the rest
#       - For the sake of the exercises, consider words to be any sequence of 
#         non-blank characters

#   -Implicit:
#       - calls capitlize on non alphanumeric characters


#   -Data Structure/Algorithm:
#      - array
#      - split
#      - transformation - map
#      - capitalize!
#      - join
#      

# - save split original array to new array
# - call map on new_arr
#      - call capitalize! on each element in iteration
# - return joined new_arr

def word_cap(str)
  new_arr = str.split(' ')
  
  new_arr.map{|word| word.capitalize!}

  new_arr.join(' ')
end


p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


#_launch_solution________

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end


