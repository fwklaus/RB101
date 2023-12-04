require "pry"
=begin
PROBLEM: determine if a give word can be spelled with a given set of spelling blocks

input: string
output: boolean
mutating?: no

rules:
   -explicit:
     - takes a string
     - returns boolean
         - whether give string can be spelled with the blocks
    - spelling blocks have two letters per block
         - a word cannot use both letters - the block can only be used once

   -implicit:
      - method is case-insensitive
     
unclear parts of problem?:

examples/test_cases:


data/alg:
- create an array of strings for the blocks
- take a string as an argument
- for each character of the string iterate over the blocks
-   - sub each character in the blocks with an empty space
- after iteration check if all the sub-arrays contain at least
     one letter and that the array is the original size
          - return false if not
          - true if it is
- 

=end



def block_word?(str)
  blocks = %w(BO GT VI XK RE LY DQ FS ZM CP JW NA HU)
  og_size = blocks.size


  str.each_char.with_index do |char, idx|
    blocks.each do |block|
     if block.include?(char.upcase)
      block.sub!(char, '')
     end
    end
  end
  binding.pry
  blocks = blocks.delete_if {|sub_str| sub_str.empty?}
  blocks.all? { |sides| sides.size >= 1 } && blocks.size == og_size
end

# p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true