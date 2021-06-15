# input: string
# output: boolean

# rules:
#   -explicit:
#       -blocks have two letters per block
#       -cannot use both letters from the same block to spell the same word
#       -a block can only be used once
#       -return boolen
#              -check whether word passed to method can be spelled from the set of blocks

#  -implicit: 
#      -blocks are key-value pairs 
#      -method is case insensitive
#      -no repeat letters

## DataStructures/Algorithm:
# hash
# Hash#each_pair
# String#chars
# Array#sort

# create spelling blocks hash
# create an empty string for comparison
# create copy of spelling blocks hash to perform destructive operations on
# for each key value pair
#    -check for each letter in the string if the block matches
#           -once a letter matches a string character, remove the key value pair from the hash
#           -if one letter matches push the letter to an empty string
#           -after iteration finishes, compare the comparioson string to the word
#                         -if they match, the word can be spelled
#                         -if not, they cannot be spelled


# the next key value pair contains the next matching letter
# rather than spell the word letter for letter, it matches letters in the order
# it encounters them in the blocks hash

SPELLING_BLOCKS = { 'B' => 'O', 'G' => 'T', 'V' => 'I', 'X' => 'K', 'R' => 'E',
  'L' => 'Y', 'D' => 'Q', 'F' => 'S', 'Z' => 'M', 'C' => 'P', 'J' => 'W', 'N' => 'A', 'H' => 'U' }

def block_word?(word)
  comp_string = ''
  blocks = SPELLING_BLOCKS.clone
  
  blocks.each_pair do |key,value|
    
    word.chars.each do |letter|
      if [key.downcase, value.downcase].include?(letter.downcase)
        comp_string << letter
        blocks.delete(key)
      end
    end
  end
  comp_string.downcase.chars.sort == word.downcase.chars.sort
end



p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true


# launch_solution_______________

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end