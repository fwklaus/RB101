# input: 3 integers
# output: symbol (triangle type)

# rules:
#  -explicit:
#      -takes length of the 3 sides of a triangle
#      -returns symbol:
#           -:equilateral - All 3 sides are of equal length
#           -:isosceles 2 sides are of equal length, while the 3rd is different
#           -:scalene All 3 sides are of different length

#     -to be valid: 
#             -sum of the lengths of the two shortest sides must be greater than the length
#              of the longest side
#             -all sides must have lengths greater than 0

### DataStructures/Algorithms:
#  -validate triangle

## valid_triangle?
#  - check if all sides are greater than zero 
#  - check if the lengths of the two shortest sides are greater than the length of the 
#    longeset side
#         - greatest side - arr.max
# 

def valid_triangle?(arr)
   if arr.all?{ |side| side > 0}
     arr.sort!
     arr[2] < arr[0] + arr[1]
   else
     false
   end
end

def determine_triangle(arr)
  balanced = 0
  arr.sort!
  arr.sort do |el1,el2|
    balanced += (el1 <=> el2)
  end
  balanced
end

def triangle(side1,side2,side3)
  triangle = valid_triangle?([side1,side2,side3]) ? :valid : :invalid
  if triangle == :valid
    type = determine_triangle([side1,side2,side3])
    triangle = case type
               when 0  then :equilateral
               when -1 then :isosceles
               else
                 :scalene
               end
  else 
    :invalid
  end
  triangle
end




p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid