#require 'yaml'
#TXT_FILE = YAML.load_file('longest_sentence.txt')

txt_file = File.read('longest_sentence.txt')

# Input: string (contents of a text file)

# Output: string(longest sentence in file(word count))

# rules:
#   -explicit: 
#      -program reads contents of a text file
#      -sentences end with (.), (!), (?)
#      -characters that are not spaces or sentence-ending characters should be treated as words
#      -prints longest sentence in file based on word count
#      -also print the number of words in the longest sentence
#     

#  -implicit:
#      -write a txt file
#      -import file to a variable

# DataStructures/Algorithm:
# -load txt file to constant(require 'yaml', YAML.load_file)
# -hash(sentence: word length)
# -split(delimit be sentence ending characters) (split(/[.|?|!/]))
# -iterate through txt_arr
# -assign sentence length as value to key value of each sentence
# -return longest sentece with sentence length 
#      -interpolate longest sentence and sentence length into a string


def longest_sentence(str)
  txt_arr = str.split(/[.|?|!]/)
  
  length_hsh = {}
  
  txt_arr.each do |sentence|
    length_hsh[sentence] = sentence.split(' ').size
  end    
  
  longest_sentence = length_hsh.key(length_hsh.values.max)
  longest_sentence_length = length_hsh[length_hsh.key(length_hsh.values.max)]
  
  "#{longest_sentence}: #{longest_sentence_length} words"

end

puts longest_sentence(txt_file)


