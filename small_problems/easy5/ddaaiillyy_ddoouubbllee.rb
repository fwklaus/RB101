=begin
def crunch(string)
  new_arr = []
  string.split(//).each do |char|
      char == new_arr.last ? next : new_arr << char
  end
  new_arr.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

#_launch_solution__________

def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end
=end




# input: string
# output: new string

# rules:
#  -explicit:
#       -takes a string argument
#       -returns a new string 
#       -new string collapses all consecutice characters into a single character
#       -do not use String#squeeze or String#squeeze!



def crunch(str)
  obj = str.chars.each_with_object([]) do |char, memo|
    memo.last == char ? next : memo << char
  end
  obj.join
end


p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''


