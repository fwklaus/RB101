
=begin
PROBLEM: method returns the middle character(s) of the argument

input: string
output: string
mutating?: no 

rules:
   -explicit:
      - takes a non-empty string
      - returns the middle character or characters of the arg
           - return one character if arg has odd length
           - return two characters if arg has even length
    
   -implicit:
     - count includes spaces/ all characters

unclear parts of problem?:

examples/test_cases:


data/alg:
- take a string as an argument
- determine whether length of string is even or odd 
    - if even
        - divide the lenght of the string by 2
             - from half minus one to half gives us middle
    othersuse
         - divide the length of the string by 2
             - half gives us the middle
- return the characters at the indexes

=end

def center_of(str)
  if str.size.even? 
    half = (str.size) / 2  
    str[(half - 1)..half]
  else
    half = (str.size) / 2
    str[half]
  end
end


p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'