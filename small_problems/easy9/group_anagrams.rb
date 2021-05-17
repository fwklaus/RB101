# Input: array (words)
# Output: prints arrays(words are grouped by their anagramatical equals)

# Rules:
#   -Explicit:
#      -takes array of string
#      -prints out arrays of anagrams 
#           -each array is comprised only of anagramatic equals

# DataStructures/Algorithm:
#  - takes array
#  - initialize new hash
#  - iterate over original arr (each)
#      -assign array elements as hash keys 
#           -set equal to empty arrays
#  - iterate over hash (each)
#       -iterate over arr (each)
#             -compare key to arr value
#                  -if sorted word equals hash key, push word to value array


def anagram(arr)
  anagrams = {}
  arr.each{ |word| anagrams[word] = []}
  anagrams.each do |key,_|
    arr.each do |word|
      if key.chars.sort.join == word.chars.sort.join
        anagrams[key] << word
      end
    end
  end
  anagrams.values.uniq.each_with_index do |_,index|
    p anagrams.values.uniq[index]
  end
end


words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
          
anagram(words)          

#_launch_solution
=begin
result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "------"
  p v
end


=end

=begin
# all anagrams

def words(arr)
  anagrams = []
  arr.each do |word1|
    arr.each do |word2|
      if word1.chars.sort.join == word2.chars.sort.join && anagrams.include?(word2) == false
          anagrams << word2
      end
    end
    
  end
  anagrams
end

=end




