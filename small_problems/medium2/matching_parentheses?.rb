require "pry-byebug"
# input: string
# output: boolean

# rules:
#   -explicit:
#       - takes a string
#       - returns boolean
#            -checks if strings are "balanced"
#                  -parentheses must occur in matching pairs to be balanced('(' and ')')
#                  -balanced pairs must start with '('

## DataStructures/Algorithm:
# - initialize balanced variable to 0
# - split string to array
# - iterate over string 
# - if element is '('
#      -add one to balanced variable
# - if element is ')'
#      -subtract one from balanced variable

# need to come up with conditions to check for leading '(' and matching pairs '()'

def balanced?(str)
  balanced = 0
  flag = true
  parentheses = str.delete("^()")
  count = 0
   
  while flag
    break if count >= parentheses.size
    if !parentheses.start_with?('(')
      balanced += 1
      flag = false
    else
      parentheses.each_char do |char|
        balanced += 1 if char == '('
        balanced -= 1 if char == ')'
      end
    end
    count += 1
  end
  
  balanced == 0 ? true : false
end


p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false