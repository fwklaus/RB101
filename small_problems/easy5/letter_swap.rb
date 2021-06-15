=begin

def swap(string)
  split_string = string.split
  joined_strings = []
  split_string.each do |word|
    split_word = word.split(//)
    swap = split_word[0]
    split_word[0] = split_word[-1]
    split_word[-1] = swap
    joined_strings << split_word.join
  end
  joined_strings.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

#_launch_solution___

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end


=end


# input: string
# output: string

# rules: 
#   explicit:
#       - takes a string of words seperated by spaces
#       - returns string with first and last letters of each word swapped
#         - assume every word contains at least one letter
#         - assume string will always contain at least one word
#         - assume string contains nothing but words and spaces 

=begin

def swap(sentence)
  sentence.split(' ').map! do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end.join(' ')
end



p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

=end

# Further Exploration
# does not work
# the method does not mutate the caller, and instead returns a new two-element
# array containing the swapped characters from each word of the sentence
# the original sentence is unaffected



def swap_first_last_characters(a, b)
  a, b = b, a
end


def swap(sentence)
  sentence.split(' ').map! do |word|
    swapped = swap_first_last_characters(word[0], word[-1])
    
    swapped.class
  end.join(' ')

end

p swap('Oh what a wonderful day it is')# == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'