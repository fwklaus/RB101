# Part 1)
=begin

def word_sizes(string)
  str_length_num = {}
  string.split(' ').map do |element|
    if str_length_num.has_key?(element.size)
      str_length_num[element.size] +=1
    else
      str_length_num[element.length] = 1
    end
  end
  str_length_num
end



p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

#_launch_solution__________

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end
#_______________________________________________________________________________
# Part 2)

# Modify the word_sizes method from the previous exercise to exclude non-letters
# when determining word size.

def word_sizes(string)
  str_length_num = Hash.new(0)
  string.split(' ').map do |element|
    word_length = element.delete('^a-zA-Z').size
    if str_length_num[word_length] == 0
      str_length_num[word_length] = 1
    else
      str_length_num[word_length] +=1
    end
  end
  str_length_num
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}


#_launch_solution__

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    counts[clean_word.size] += 1
  end
  counts
end



# input: string
# output: hash

# rules:
#   - takes string - contains space seperated words
#   - returns hash - keys: word sizes, values: frequency
#   - words consist of any string of characters that do no include a space


# take word string
# initialize empty hash
# split string to array at empty spaces
# iterate over array
     # if word_szs includes word length increment value for size
     # otherwise initialize new key value pair
# return hash


def word_sizes(str)
  wrd_szs = {}
  
  str.split(' ').each do |word|
     if wrd_szs.include?(word.size)
       wrd_szs[word.size] += 1
     else
       wrd_szs[word.size] = 1
    end
  end
  
  wrd_szs
end



p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

=end

# part 2



def word_sizes(str)
  wrd_szs = Hash.new(0)
  
  str.split(' ').each do |word|
    word.delete!('^A-Za-z ')
    wrd_szs[word.size] += 1
  end
  
  wrd_szs
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}