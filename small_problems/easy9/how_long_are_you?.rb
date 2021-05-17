# Input: string
# Output: array

# Rules:
#   -Explicit:
#      -method takes a string
#      -returns an array
#        - contains every word fron  the string
#        - append a space and word length to each word
#      -words are seperated by exactly one space
#      -any substring is a word

# Data Structures/Algorithm
#  -take string 
#  -initialize new array
#  -split string to array
#  -append length of element to each element seperated by space - map
#  



def word_lengths(str)
  new_arr = str.split
  new_arr.map do |ele|
    ele + ' ' + ele.length.to_s
  end
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []