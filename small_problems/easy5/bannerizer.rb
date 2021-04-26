# Write a method that will take a short line of text, and print it within a box.
# require "pry"
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


