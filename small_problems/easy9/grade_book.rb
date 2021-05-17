# input: integers(3)
# output: string character

# Rules:
#   -Explicit:
#     - takes three integers(scores)
#     - averages three values
#     - returns string character(letter value) associated with average
#     -test values between 0 and 100
#           -don't check for negative values, or values greater than 100

# DataStructures/Algorithm
#  -initialize grades constant variable - hash
#       -grade keys, score range values
#  -add up and divide three scored
#  -store result in average variable
#  -iterate over hash keys
#      -if value range contains avg
#               return key


GRADES = {
  'A' => 90..100,
  'B' => 80..89,
  'C' => 70..79,
  'D' => 60..69,
  'F' => ..59
}


def get_grade(*scores)
  avg = (scores.reduce(:+) / 3)
  
  GRADES.each do |key,_|
    return key if GRADES[key].cover?(avg)
  end
  
end
  


p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"


#_launch_solution___

def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end