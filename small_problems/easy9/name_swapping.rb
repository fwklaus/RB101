# Input: string  
# Output: string

# Rules:
#   -Explicit:
#      -takes a single string argument
#             -first name, space, last name
#      -returns string
#             -last name, comma, space, first name

# DataStructures/Algorithm:
#  -take string argument
#  -split name to array
#  -conatenate string with last name first, second name last, seperated by a 
#   comma and a space

def swap_name(str)
  name = str.split
  "#{name.last}, #{name.first}"
end


p swap_name('Joe Roberts') == 'Roberts, Joe'

#_launch_solution___

def swap_name(name)
  name.split(' ').reverse.join(', ')
end