# Write a method that takes one argument, a string, and returns a new string
# with the words in reverse order.


=begin

def reverse_sentence(str)
  new_arr = []
  str_arr = str.split(' ')
  
  while str_arr.size > 0
    ele = str_arr.pop
    new_arr.push(ele)
  end
  
  new_arr.join(' ')
  
end    




puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

# The tests above should print true.

#__________________launch_solution________________________

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

=end

####################################################################
# Part 2

# Write a method that takes one argument, a string containing one or more
# words, and returns the given string with words that contain five or more
# characters reversed. Each string will consist of only letters and spaces.
# Spaces should be included only when more than one word is present.


# non-destructive
def reverse_words(str) 
  reversed = str.split(' ').map do|word|
    word.size >= 5 ? word.reverse : word
  end
  reversed.join(' ')
end

# destructive
def reverse_words(str) 
  str.split(' ').map{|word| word.size >= 5 ? word.reverse : word}.join(' ')
end


puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS


#________________launch_solutions__________________


def reverse_words(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
end