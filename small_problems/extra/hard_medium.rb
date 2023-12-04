require 'pry'
# 1000 lights

# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

=begin
PROBLEM:

input: integer (n switches)
output: array (lights on)
mutating?:

rules:
   -explicit:
       - take an integer
            - n lights
            - n repetitions
       - return array
            - whihc lights are on after n repetitions
   -implicit:
      - we toggle the multiples of the current repetition
unclear parts of problem?:

examples/test_cases:


data/alg:
- take an integer
- create a hash to store state of switches
     - :on, and :off
- initialize lights
    - round one, all lights are turned on
- toggle lights - step
    - round 2, switch multiples of 2 to opposite position
    - round 3, switch multiples of 3 to opposite position
    - etc. 

=end

# def initialize_lights(n)
#   hsh = {:on => [], :off => []}

#   (1..n).to_a.each do |num|
#     hsh[:on] << num
#   end

#   hsh
# end

# def toggle_lights(lights, round, n)
#   round.step(by: round, to: n) do |num|
#     if lights[:on].include?(num)
#       lights[:off] << lights[:on].delete(num)
#     else
#       lights[:on] << lights[:off].delete(num)
#     end
#   end
# end


# def lights(n)
#   lights = initialize_lights(n)

#   round = 2
#   loop do 
#     break if round > n
#     toggle_lights(lights, round, n)
#     round += 1
#   end

#   lights[:on]
# end

# p lights(5) == [1,4]
# p lights(10) == [1,4,9]


# now I know my ABCs

# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.
  
=begin
PROBLEM:

input: string
output: boolean
mutating?: no

rules:
   -explicit:
       - takes a string 
       - returns boolean
          - whether argument can be spelled with the given blocks
        
        - the spelling blocks can only be used once each
            - cannot use it for both letters

        - case insensitive
    
   -implicit:
     
unclear parts of problem?:

examples/test_cases:


data/alg:
- create a data structure to store the blocks
- covert string to uppercase 
- iterate over the blocks
  - for each block 
     -check if there are less than two letters from the block
     used in the word
       - if not return false

=end

BLOCKS = %w(BO GT VI XK RE LY DQ FS ZM CP JW NA HU)

def block_word?(str)
  str = str.upcase

  BLOCKS.all? do |block|
    str.count(block) <= 1
  end
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true