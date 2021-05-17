# Input: 2 arguments - array, hash
# Output: interpolated string(contains array elements, and hash values)

# Rules:
#   -Explicit: 
#       - takes 2 arguments:
#          -an array:
#             -contains 2 or more elements
#             -when combined with adjoining spaces produce a person's name
#          -a hash:
#             -contains two keys: :title, :ocupation, and appropriate values
#       -method returns greeting
#           -uses person't full name
#           -mentions person's title and occupation
#                       
#   -Implicit:
#       - takes array literal and hash literal

# greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# Data Structures/Algorithm
#  -takes array and hash
#  -assign array to name variable
#         -join array with space delimiter
#  -assign title and occupation to appropriate variables
#  -write greeting
#      -interpolate name variable
#      -interpolate title and occupation
#  -return greeting

def greetings(name_arr, job_hsh)
  name = name_arr.join(' ')
  title = job_hsh[:title]
  occupation = job_hsh[:occupation]
  "Hello #{name}! Nice to have a #{title} #{occupation} around."
  
end


p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })