def print_in_box(str)
  end_line = "+-#{"-" * str.size}-+"
  blank_line = "| #{' ' * str.size} |"
  word_line = "| #{str} |"
  
  puts end_line
  puts blank_line
  puts word_line
  puts blank_line
  puts end_line
end

print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+