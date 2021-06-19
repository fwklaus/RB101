# Input: positive integer (n)
# Output: displays right triangle whose sides each have n stars

# Rules: 
#   Explicit: 
#      -takes positive integer(n)
#      -displays right triangle where each side is n sides long
#      -hypotenuse should terminate at lower-left, and upper-right
#       of display

#   Implicit:
#      -Prints n elements on each line
#         - first line, one star is printed in the last space, other elements are blank
#         - on consecutive lines, the number of stars displayed increases by one
#           and blank spaces decrease by one
#         -on the last line all n spaces display a star


# Data Structures/Algorithm
#     -loop

#     - initialize count variable, set equal to 1
#     - initialize loop
#       - on each iteration print n elements
#           - on successive iterations, print, from right to left, one more star
#             and one less space
#           - decrement count by 1
#           - break if count > n
#       


# looping structure:
#      -On each line we print n elements
#           -first line we print 1 star padded by n - 1 empty spaces
#           -second line we print 2 stars padded by n - 2 empty spaces
#           -third line we print 3 stars padded by n - 3 empty spaces
#           - ...
#      On each line we print interpolated string
#          - string contains ((spaces * (n - count), and  (stars * count)
#     - break if count > n
=begin


def triangle(n)
  count = 1
  loop do
    break if count > n
    puts "#{(' ' * (n - count))}#{('*' * (count)) }"
    count += 1 
  end
end



triangle(9)
triangle(5)


#_launch_solution_____

def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end

=begin
Examples:

triangle(5)

    *
   **
  ***
 ****
*****

triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

=end



# input: integer
# output: string representation of integer(right triangle)

# rules:
#   -explicit:
#       -takes positive integer(n)
#       - displays right triangle 
#              -sides have (n) stars
#       -hypotenuse goes from bottom left to top right

# def triangle(n)
#   1.upto(n) do |num|
#     puts (' ' * (n - num)) + ('*' * num )
#   end
# end
  
  
# triangle(5)

#     *
#    **
#   ***
#  ****
# *****



# triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

# further exploration


# upside down

# take symbol
def triangle(n, direction = :top_left)
  case direction
  when :top_left
    (n + 1).times { |num| puts '*' * num }
  when :bottom_left
    (n).downto(1) { |num| puts '*' * num}
  when :top_right
    1.upto(n) do |num|
      puts (' ' * (n - num)) + ('*' * num )
    end
  when :bottom_right
    0.upto(n) do |num|
      puts (' ' * num) + ('*' * (n - num) )
    end
  end
end
  
  
triangle(5, :bottom_left)


triangle(9, :top_right)