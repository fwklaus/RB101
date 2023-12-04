def triangle(int)
  arr = []
  int.times do |i|
    row = " " * (int - (i + 1)) + ("*" * (i + 1))  
    arr << row
  end
  puts arr
end

triangle(5)

#     *
#    **
#   ***
#  ****
# *****

triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********