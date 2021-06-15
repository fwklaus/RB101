require 'pry-byebug'
=begin
def print_in_box(string)
  
  dash = '--'
  space = '  '
  string.length.times do |_|
    dash += '-'
    space += ' '
  end


puts "+#{dash}+"
puts "|#{space}|"
puts "| #{string.length == 0 ? '' : string } |"
puts "|#{space}|"
puts "+#{dash}+"

end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')

#_launch_solution____

def print_in_box(message)
   horizontal_rule = "+#{'-' * (message.size + 2)}+"
   empty_line = "|#{' ' * (message.size + 2)}|"

   puts horizontal_rule
   puts empty_line
   puts "| #{message} |"
   puts empty_line
   puts horizontal_rule
end


# input: string
# output: string

# rules:
#   -explicit:
#        - take a short line of text
#        - output text in a box
#        - box width changes according to line
#               -line is centered in string
#               -text is on center line


# DataStructures/Algorithm
# -make defualt box
# -

def print_in_box(str)
  dash_line = "+-#{'-' * str.size}-+"
  blank_line = "| #{' ' * str.size} |"
  text_line = "| #{str} |"
  
  puts dash_line
  puts blank_line
  puts text_line
  puts blank_line
  puts dash_line
end


print_in_box("")

=end

# set max width to 80
# if string size is greater than 80
#   set width to 80
#   remove difference from string


def print_in_box(str)
  width = str.size
  wrap = ''
  if width > 80
    width = 80
    diff = str.size - width
    wrap = str.slice!(-diff..)
  end
  dash_line = "+-#{'-' * width}-+"
  blank_line = "| #{' ' * width} |"
  text_line = "| #{str} |"
  last_line = "| #{wrap + ' ' * (width - wrap.size)} | "
  
  
  puts dash_line
  puts blank_line
  puts text_line
  puts last_line
  puts dash_line
end

print_in_box("dddd123dddd12345dddddddd12dddtddddddddddddddd1234alkfhlakjdfhddddddxxxxxxxxdddddddy80123")