# Input: Integer
# Output: displays 4-pointed diamond(n x n grid)

# Rules:
#   -Explicit:
#      -displays 4-pointed diamond
#      -n x n grid, prints n rows, n characters long
#      -assume the argument will always be an odd integer

#   -Implicit:
#      -spaces are always even numbers



# first row 

=begin

diamond(1)

*

diamond(3)

 *
***
 *

diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
    
=end

## DataStructures/Algorithm
# - takes an integer(n)
# - print n row of n stars

## populate stars
# -initialize empty array
# -from 1 to n (step)
#     -step by odd numbers
#     -push odd numbered star strings to array
# -do the same in reverse

# example - diamond(3)
# row 1:' * '
# row 2:'***'
#

## transform stars
# iterate over array (map!)
# center each substring of array in array_length (center)

# output each substring of string array (puts)

#________________________________________________________________________________



def populate_stars(n)
  stars = []

  1.step(by:2,to:n) do |num|
    stars << ('*' * num)
  end

  (n - 2).step(by:-2,to:1) do |num|
    stars << ('*' * num)
  end

  stars
end

def transform_stars(str_arr)
  str_arr.map! do |sub_str|
    sub_str.center(str_arr.length)
  end
end

def diamond(n)
  stars_arr = populate_stars(n)
  transform_stars(stars_arr)
  
  puts stars_arr
end


diamond(3)
diamond(5)
diamond(7)
diamond(9)

