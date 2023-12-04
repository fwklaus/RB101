require "pry"
=begin
PROBLEM: returns a new string in which ever consonant from the input string is doubled

input: string
output: string
mutating?: no

rules:
   -explicit:
      -takes a string
        -vowels, digits, and whitepsace should not be doubled
      -returns a new string

   -implicit:
     
data/alg:
- initialize a new empty string
- create an alphabetic range
    - delete all characters except for the consonants
- iterate over the input string - each char
-   check if the character is in the double range
      -if it is, double the character
      - otherwise, do not 

=end

def double_consonants(str)
  new_str = ''
  alphabet = ("a".."z").to_a
  cons_alphabet = alphabet.map do |char|
    %w(a e i o u).include?(char) ? '' : char
  end.join.chars

  str.each_char do |char|
    if cons_alphabet.include?(char.downcase)
      new_str << char * 2
    else
      new_str << char
    end
  end
  new_str
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!")== "HHellllo-WWorrlldd!"
p double_consonants("July 4th")== "JJullyy 4tthh"
p double_consonants('') == ""